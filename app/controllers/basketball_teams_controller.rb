class BasketballTeamsController < ApplicationController
  def index
    @basketball_teams = BasketballTeam.all
  end

  def show
    @basketball_team = BasketballTeam.find(params[:id])

  end

  def sort
    @basketball_teams = BasketballTeam.order(created_at: :desc)
  end

end
