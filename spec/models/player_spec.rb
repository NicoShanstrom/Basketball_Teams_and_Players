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
end
    