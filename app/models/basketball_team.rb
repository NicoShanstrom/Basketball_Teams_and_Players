class BasketballTeam < ApplicationRecord
    has_many :players
    validates :name, presence: true
    validates :city, presence: true
    validates :innaguration_year, presence: true
    validates :championship, presence: true
    validates :conference, presence: true
    
    def count_players
        players.count
    end
end