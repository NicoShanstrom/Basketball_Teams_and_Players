require 'rails_helper'

RSpec.describe Player, type: :model do
    describe 'validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:jersey_number) }
        it { should validate_presence_of(:year_drafted) }
        it { should validate_presence_of(:all_star) }
        it { should validate_presence_of(:basketball_team_id) }
    end

    describe 'relationships' do
        it { should belong_to(:basketball_team) }
    end

    describe "#count_players" do
        it "counts the number of players of a team" do
            heat = BasketballTeam.create!(name: 'HEAT', city: 'Miami', innaguration_year: 1988, championship: true, conference: 'Eastern Conference')
            lakers = BasketballTeam.create!(name: 'Lakers', city: 'Los Angeles', innaguration_year: 1945, championship: true, conference: 'Western Conference')
            dwade = heat.players.create!(name: 'Dwayne Wade', jersey_number: 3, year_drafted: 2003, all_star: true)
            himmy = heat.players.create!(name: 'Jimmy Butler', jersey_number: 22, year_drafted: 2011, all_star: true)
            bosh = heat.players.create!(name: 'Chris Bosh', jersey_number: 1, year_drafted: 2003, all_star: true)
            lebron = lakers.players.create!(name: 'Lebron James', jersey_number: 23, year_drafted: 2003, all_star: true)
            kobe = lakers.players.create!(name: 'Kobe Bryant', jersey_number: 24, year_drafted: 1996, all_star: true)
            shaq = lakers.players.create!(name: 'Shaquille Oneal', jersey_number: 32, year_drafted: 1992, all_star: true)

            expect(heat.count_players).to eq(3)
        end
    end

end
    