# User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)

require 'rails_helper'

RSpec.describe 'basketball_teams#show', type: :feature do

    before :each do
        @heat = BasketballTeam.create!(name: 'HEAT', city: 'Miami', innaguration_year: 1988, championship: true, conference: 'Eastern Conference')
        @lakers = BasketballTeam.create!(name: 'Lakers', city: 'Los Angeles', innaguration_year: 1945, championship: true, conference: 'Western Conference')
    end

    it 'returns the basketball team with entered :id and its attributes' do
        visit "/basketball_teams/#{@heat.id}"
        
        expect(page).to have_content(@heat.name)
        expect(page).to have_content(@heat.city)
        expect(page).to have_content(@heat.innaguration_year)
        expect(page).to have_content(@heat.championship)
        expect(page).to have_content(@heat.conference)
    end

    # User Story 10, Parent Child Index Link

    # As a visitor
    # When I visit a parent show page ('/parents/:id')
    # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')

    it 'has a link to take the user to the specific basketball team players page' do
       visit "/basketball_teams/#{@heat.id}"
       expect(page).to have_link("/basketball_teams/#{@heat.id}/players")
    end

# User Story 7, Parent Child Count

# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent

    describe 'basketball_team.players.count' do
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

        it 'shows the number of players associated with a specific basketball team :id' do
            visit "/basketball_teams/#{@heat.id}"
            
            expect(page).to have_content("Number of Players: 3")
            # expect(@heat.count_players).to eq(3)
        end
    end

end