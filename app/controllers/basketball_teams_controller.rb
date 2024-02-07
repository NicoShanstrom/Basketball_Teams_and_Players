class BasketballTeamsController < ApplicationController
  def index
    @basketball_teams = BasketballTeam.ordered_teams
  end

  def show
    @basketball_team = BasketballTeam.find(params[:id])
    @count = @basketball_team.players.count_players
  end
end
