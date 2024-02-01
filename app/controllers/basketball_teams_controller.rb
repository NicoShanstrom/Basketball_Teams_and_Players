class BasketballTeamsController < ApplicationController
  def index
    @basketball_teams = BasketballTeam.all
  end

  def show
    @basketball_team = BasketballTeam.find(params[:id])
  end
end
