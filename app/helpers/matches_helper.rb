module MatchesHelper
  def show_match_date(match)
    match.played_at.strftime("%b %d, %Y")
  end

  def show_opponent_of(user, match)
    match.opponent_of(user).email
  end

  def show_score(user, match)
    "#{match.user_score(user)} - #{match.opponent_score(user)}"
  end

  def show_result(user, match)
    match.winner?(user) ? "W" : "L"
  end
end
