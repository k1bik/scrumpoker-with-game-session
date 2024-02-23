require "rails_helper"

RSpec.describe Password, type: :model do
  subject { described_class.new(params) }

  describe "validations" do
    let(:params) do
      {
        new_password: "new_password",
        old_password: "old_password",
        new_password_confirmation: "new_password",
        current_password_digest: BCrypt::Password.create("old_password")
      }
    end

    it "validates presence of old_password" do
      expect(subject).to validate_presence_of(:old_password)
    end

    it "validates presence of new_password" do
      expect(subject).to validate_presence_of(:new_password)
    end

    it "validates presence of new_password_confirmation" do
      expect(subject).to validate_presence_of(:new_password_confirmation)
    end

    context "when params are valid" do
      context "when old password matches current password" do
        let(:params) do
          {
            new_password: "new_password",
            old_password: "old_password",
            new_password_confirmation: "new_password",
            current_password_digest: BCrypt::Password.create("old_password")
          }
        end

        it "is valid" do
          expect(subject).to be_valid
        end
      end

      context "when new password matches confirmation" do
        let(:params) do
          {
            new_password: "new_password",
            old_password: "old_password",
            new_password_confirmation: "new_password",
            current_password_digest: BCrypt::Password.create("old_password")
          }
        end

        it "is valid" do
          expect(subject).to be_valid
        end
      end
    end

    context "when params are invalid" do
      context "when old password does not match current password" do
        let(:params) do
          {
            new_password: "new_password",
            old_password: "wrong",
            new_password_confirmation: "new_password",
            current_password_digest: BCrypt::Password.create("old_password")
          }
        end

        it "is not valid" do
          expect(subject).not_to be_valid
        end

        it "adds an error to old password" do
          subject.valid?
          expect(subject.errors[:old_password]).to be_present
        end
      end

      context "when new password does not match confirmation" do
        let(:params) do
          {
            new_password: "new_password",
            old_password: "old_password",
            new_password_confirmation: "wrong",
            current_password_digest: BCrypt::Password.create("old_password")
          }
        end

        it "is not valid" do
          expect(subject).not_to be_valid
        end

        it "adds an error to new password" do
          subject.valid?
          expect(subject.errors[:new_password_confirmation]).to be_present
        end
      end
    end
  end
end
