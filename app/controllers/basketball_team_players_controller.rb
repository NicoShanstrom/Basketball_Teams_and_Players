class BasketballTeamPlayersController < ApplicationController
    def index
        @basketball_team = BasketballTeam.find_by(id: params[:basketball_team_id])
    end

end