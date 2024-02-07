# User Story 5, Parent Children Index 

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)

require 'rails_helper'

RSpec.describe 'basketball_teams_players#index', type: :feature do
    before :each do 
        
        @heat = BasketballTeam.create!(name: 'HEAT', city: 'Miami', innaguration_year: 1988, championship: true, conference: 'Eastern Conference')
        @lakers = BasketballTeam.create!(name: 'Lakers', city: 'Los Angeles', innaguration_year: 1945, championship: true, conference: 'Western Conference')
        @dwade = @heat.players.create!(name: 'Dwayne Wade', jersey_number: 3, year_drafted: 2003, all_star: true)
        @himmy = @heat.players.create!(name: 'Jimmy Butler', jersey_number: 22, year_drafted: 2011, all_star: true)
        @bosh = @heat.players.create!(name: 'Chris Bosh', jersey_number: 1, year_drafted: 2003, all_star: true)
        @lebron = @lakers.players.create!(name: 'Lebron James', jersey_number: 23, year_drafted: 2003, all_star: true)
        @kobe = @lakers.players.create!(name: 'Kobe Bryant', jersey_number: 24, year_drafted: 1996, all_star: true)
        @shaq = @lakers.players.create!(name: 'Shaquille Oneal', jersey_number: 32, year_drafted: 1992, all_star: true)
    end

    it 'displays each player that is associated with the specified basketball team :id' do
        visit "/basketball_teams/#{@lakers.id}/players"
       
        expected_players = [@lebron, @shaq, @kobe]

        expected_players.each do |player|
            expect(page).to have_content(player.name)
            expect(page).to have_content(player.jersey_number)
            expect(page).to have_content(player.year_drafted)
            expect(page).to have_content(player.all_star)
            expect(page).to have_content(player.basketball_team_id)
        end
    end
end