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
    it { is_expected.to validate_numericality_of(:player1_score).only_integer.is_greater_than(0) }
    it { is_expected.to validate_presence_of(:player2_score) }
    it { is_expected.to validate_numericality_of(:player2_score).only_integer.is_greater_than(0) }
    it { is_expected.to validate_presence_of(:played_at) }

    context "scores" do
      subject(:match) { FactoryGirl.create(:match) }

      context "with winning score" do
        it "is a valid match with a commond winning score" do
          match.player1_score = 21
          match.player2_score = 15
          match.valid?

          expect(match.errors.keys).not_to include(:player1_score, :player2_score)
        end

        it "stores a match with a two-point margin score" do
          match.player1_score = 21
          match.player2_score = 23
          match.valid?

          expect(match.errors.keys).not_to include(:player1_score, :player2_score)
        end

        it "adds an error if a match doesn't have a winning score" do
          match.player1_score = 20
          match.player2_score = 3
          match.valid?

          expect(match.errors[:player1_score]).to include("There must be a winning score")
          expect(match.errors[:player2_score]).to include("There must be a winning score")
        end

        it "adds an error if a match doesn't have a two-point margin score" do
          match.player1_score = 21
          match.player2_score = 22
          match.valid?

          expect(match.errors[:player1_score]).to include("There must be a two-point margin winning score")
          expect(match.errors[:player2_score]).to include("There must be a two-point margin winning score")
        end

        it "adds an error if a match have more than a two-point margin score" do
          match.player1_score = 21
          match.player2_score = 30
          match.valid?

          expect(match.errors[:player1_score]).to include("There must be a two-point margin winning score")
          expect(match.errors[:player2_score]).to include("There must be a two-point margin winning score")
        end
      end
    end
  end
end
