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
end