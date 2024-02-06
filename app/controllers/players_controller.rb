class PlayersController < ApplicationController
    def index
        @players = Player.all
    end

    def show
        @player = Player.find(params[:id])
    end

private
    def player_params
        params.permit(:name, :jersey_number, :year_drafted, :all_star, :basketball_team_id)
    end
end