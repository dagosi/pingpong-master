class Match < ActiveRecord::Base
  belongs_to :player1, class_name: "User"
  belongs_to :player2, class_name: "User"

  validates :player1, :player2, :player1_score, :player2_score, :played_at, presence: true
  validates :player1_score, :player2_score, numericality: { only_integer: true, greater_than: 0 }

  validate :validate_wining_score

private
  def validate_wining_score
    return if player1_score.nil? || player2_score.nil?

    if player1_score < 21 && player2_score < 21
      errors.add(:player1_score, "There must be a winning score")
      errors.add(:player2_score, "There must be a winning score")
    elsif player1_score > 19 && player2_score > 19
      point_diff = (player1_score - player2_score).abs

      if point_diff < 2 || point_diff > 2
        errors.add(:player1_score, "There must be a two-point margin winning score")
        errors.add(:player2_score, "There must be a two-point margin winning score")
      end
    end
  end
end
