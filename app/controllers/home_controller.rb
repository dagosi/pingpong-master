class HomeController < ApplicationController
  def index
    if current_user
      @ranked_users = User.order(score: :desc)
    end
  end
end
