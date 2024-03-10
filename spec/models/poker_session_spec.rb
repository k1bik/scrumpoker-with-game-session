require "rails_helper"

RSpec.describe PokerSession, type: :model do
  describe "associations" do
    it { should belong_to(:creator) }
    it { should have_many(:poker_session_participants) }
    it { should have_many(:participants) }
    it { should have_many(:tasks) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:estimates) }
  end
end
