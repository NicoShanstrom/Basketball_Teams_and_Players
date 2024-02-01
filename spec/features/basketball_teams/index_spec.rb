# User Story 1, Parent Index 

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

require 'rails_helper'

RSpec.describe 'basketball_teams#index' do

    before :each do
        @heat = BasketballTeam.create!(name: 'HEAT', city: 'Miami', innaguration_year: 1988, championship: true, conference: 'Eastern Conference')
        @lakers = BasketballTeam.create!(name: 'Lakers', city: 'Los Angeles', innaguration_year: 1945, championship: true, conference: 'Western Conference')
    end

    it 'shows all of the stored basketball teams names' do
        visit "/basketball_teams"
        # save_and_open_page
        expect(page).to have_content(@heat.name)
        expect(page).to have_content(@lakers.name)
    end
end