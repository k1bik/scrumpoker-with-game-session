require 'rails_helper'

RSpec.describe GameParticipant, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:game) }
    it { should have_one(:participant_estimate) }
  end
end
