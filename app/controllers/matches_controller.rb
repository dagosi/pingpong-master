class MatchesController < ApplicationController
  def index
    @matches = current_user.matches
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    @match.player1 = current_user

    if @match.save
      redirect_to matches_url
    else
      render :new
    end
  end

private
  def match_params
    params.require(:match).permit(
      :played_at,
      :player2_id,
      :player1_score,
      :player2_score
      )
  end
end
