require 'rails_helper'

RSpec.describe PokerSessionParticipant, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:poker_session) }
    it { should have_one(:participant_estimate) }
  end
end
