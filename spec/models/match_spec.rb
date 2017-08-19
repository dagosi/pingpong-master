require 'rails_helper'

describe Match, type: :model do
  describe "relationships" do
    it { is_expected.to belong_to(:player1) }
    it { is_expected.to belong_to(:player2) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:player1) }
    it { is_expected.to validate_presence_of(:player2) }
    it { is_expected.to validate_presence_of(:player1_score) }
    it { is_expected.to validate_presence_of(:player2_score) }
    it { is_expected.to validate_presence_of(:played_at) }
  end
end
