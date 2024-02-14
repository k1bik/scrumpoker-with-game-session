require 'rails_helper'

RSpec.describe ParticipantEstimate, type: :model do
  describe "associations" do
    it { should belong_to(:game_participant) }
  end
end
