require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    let!(:user) { create(:user) }

    it { is_expected.to validate_presence_of(:nickname) }
    it { should validate_uniqueness_of(:nickname) }
    it { is_expected.to validate_length_of(:nickname).is_at_most User::NICKNAME_LENGTH }
    it { is_expected.to validate_presence_of :password_digest }
  end
end
