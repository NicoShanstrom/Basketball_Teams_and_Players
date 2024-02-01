# User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)

require 'rails_helper'

RSpec.describe 'basketball_teams#show' do

    before :each do
        @heat = BasketballTeam.create!(name: 'HEAT', city: 'Miami', innaguration_year: 1988, championship: true, conference: 'Eastern Conference')
        @lakers = BasketballTeam.create!(name: 'Lakers', city: 'Los Angeles', innaguration_year: 1945, championship: true, conference: 'Western Conference')
    end

    it 'returns the basketball team with entered :id and its attributes' do
        visit "/basketball_teams/#{@heat.id}"
        # save_and_open_page
        expect(page).to have_content(@heat.name)
        expect(page).to have_content(@heat.city)
        expect(page).to have_content(@heat.innaguration_year)
        expect(page).to have_content(@heat.championship)
        expect(page).to have_content(@heat.conference)
    end
end