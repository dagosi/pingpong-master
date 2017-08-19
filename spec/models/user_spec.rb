require 'rails_helper'

describe User, type: :model do
  describe "validations" do
  end

  describe "#matches" do
    subject(:user) { FactoryGirl.create(:user) }

    it "returns matches where the user is the player1" do
      matches = FactoryGirl.create_list(:match, 3, player1: user)
      expect(user.matches).to eq(matches)
    end

    it "returns matches where the user is the player2" do
      matches = FactoryGirl.create_list(:match, 3, player2: user)
      expect(user.matches).to eq(matches)
    end
  end
end
