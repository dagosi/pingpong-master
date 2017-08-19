class Match < ActiveRecord::Base
  belongs_to :player1, class_name: "User"
  belongs_to :player2, class_name: "User"

  validates :player1, :player2, :player1_score, :player2_score, :played_at, presence: true
end
