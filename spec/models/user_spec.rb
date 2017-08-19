require 'rails_helper'

describe User, type: :model do
  describe "validations" do
  end

  subject(:user) { FactoryGirl.create(:user) }

  describe "#matches" do
    it "returns matches where the user is the player1" do
      matches = FactoryGirl.create_list(:match, 3, player1: user)
      expect(user.matches).to eq(matches)
    end

    it "returns matches where the user is the player2" do
      matches = FactoryGirl.create_list(:match, 3, player2: user)
      expect(user.matches).to eq(matches)
    end
  end

  describe "#opponents" do
    it 'returns all users but the current user' do
      other_users = FactoryGirl.create_list(:user, 5)
      opponents = user.opponents

      expect(opponents).not_to include(user)
      expect(opponents).to include(*other_users)
      expect(User.count).to eq(6)
    end
  end
end
