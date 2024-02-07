require 'rails_helper'

RSpec.describe BasketballTeam, type: :model do
    describe 'validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:city) }
        it { should validate_presence_of(:innaguration_year) }
        it { should validate_presence_of(:championship) }
        it { should validate_presence_of(:conference) }
    end

    describe 'relationships' do
        it { should have_many(:players) }
    end
    # User Story 6, Parent Index sorted by Most Recently Created 

    # As a visitor
    # When I visit the parent index,
    # I see that records are ordered by most recently created first
    # And next to each of the records I see when it was created

    describe "ordered_teams" do
        it 'orders basketball teams by most recently created first' do
            heat = BasketballTeam.create!(name: 'HEAT', city: 'Miami', innaguration_year: 1988, championship: true, conference: 'Eastern Conference')
            lakers = BasketballTeam.create!(name: 'Lakers', city: 'Los Angeles', innaguration_year: 1945, championship: true, conference: 'Western Conference')
            
            expect(BasketballTeam.ordered_teams).to eq([lakers, heat])
        end
    end
    # describe "count_players" do
    #     it { should count(:players) }
    # end
end