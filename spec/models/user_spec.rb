require "rails_helper"

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:game_participants) }
    it { should have_many(:created_games) }
    it { should have_many(:games) }
  end

  describe "validations" do
    let!(:user) { create(:user) }

    it { is_expected.to validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most User::NAME_LENGTH }
    it { is_expected.to validate_presence_of :password_digest }
  end
end
