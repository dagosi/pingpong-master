require 'rails_helper'

describe Rating, type: :model do
  it "returns ratings when player1 wins" do
    player1 = FactoryGirl.create(:user, score: 2400)
    player2 = FactoryGirl.create(:user, score: 2000)

    rating = Rating.new(player1, player2, player1)
    expect(rating.calculate).to eq({ player1.id => 2403, player2.id => 1997})
  end

  it "returns ratings when player2 wins" do
    player1 = FactoryGirl.create(:user, score: 2400)
    player2 = FactoryGirl.create(:user, score: 2000)

    rating = Rating.new(player1, player2, player2)
    expect(rating.calculate).to eq({ player1.id => 2371, player2.id => 2029})
  end
end
