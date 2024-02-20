require 'rails_helper'

RSpec.describe PokerSession, type: :model do
  describe "associations" do
    it { should belong_to(:creator) }
    it { should have_many(:poker_session_participants) }
    it { should have_many(:participants) }
  end
end
