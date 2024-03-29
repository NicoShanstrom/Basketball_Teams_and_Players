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

    it 'shows all of the stored basketball teams names', type: :feature do
        visit "/basketball_teams"
        # save_and_open_page
        expect(page).to have_content(@heat.name)
        expect(page).to have_content(@lakers.name)
    end

    # User Story 8, Child Index Link

    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index

    it 'has a link on the top of any page to the player index page' do
        visit '/basketball_teams'

        expect(page).to have_link('All Players')
    end
end