require "rails_helper"

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:created_poker_sessions) }
    it { should have_many(:poker_session_participants) }
    it { should have_many(:poker_sessions) }
  end

  describe "validations" do
    let!(:user) { create(:user) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most User::NAME_LENGTH }
    it { is_expected.to validate_presence_of :password_digest }
  end
end
