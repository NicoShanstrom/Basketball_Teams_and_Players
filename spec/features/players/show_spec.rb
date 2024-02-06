# User Story 4, Child Show 

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)

require 'rails_helper'

RSpec.describe 'players#show' do
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

    it 'shows the player of the entered :id with all attributes' do
        visit "players/#{@dwade.id}"

        expect(page).to have_content(@dwade.name)
        expect(page).to have_content(@dwade.jersey_number)
        expect(page).to have_content(@dwade.year_drafted)
        expect(page).to have_content(@dwade.all_star)
        expect(page).to have_content(@dwade.basketball_team_id)
    end
end 