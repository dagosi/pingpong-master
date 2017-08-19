# Calculate the ratings based on the ELO rating system
# Sources:
# https://en.wikipedia.org/wiki/Elo_rating_system
# https://metinmediamath.wordpress.com/2013/11/27/how-to-calculate-the-elo-rating-including-example/

class Rating
  attr_accessor :player1, :player2, :winner

  K_FACTOR = 32  # How strong a match will impact players' ratings.

  def initialize(player1, player2, winner)
    @player1 = player1
    @player2 = player2
    @winner = winner
  end

  def calculate
    player1_rating = player1.score + K_FACTOR * (match_score(player1) - expected_score(player1, player2))
    player2_rating = player2.score + K_FACTOR * (match_score(player2) - expected_score(player2, player1))

    { player1.id => player1_rating.round.to_i, player2.id => player2_rating.round.to_i }
  end

private
  def calculate_transformed_rating(player)
    10 ** (player.score / 400.0)
  end

  def expected_score(player, opponent)
    rating_player = calculate_transformed_rating(player)
    rating_opponent = calculate_transformed_rating(opponent)

    rating_player / (rating_player + rating_opponent)
  end

  def match_score(player)
    player == winner ? 1 : 0
  end
end
