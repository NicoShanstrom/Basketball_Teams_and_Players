class Player < ApplicationRecord
    belongs_to :basketball_team
    validates :name, presence: true
    validates :jersey_number, presence: true
    validates :year_drafted, presence: true
    validates :all_star, presence: true
    validates :basketball_team_id, presence: true
end