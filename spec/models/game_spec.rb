require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "associations" do
    it { should belong_to(:creator) }
    it { should have_many(:game_participants) }
    it { should have_many(:participants) }
  end
end
