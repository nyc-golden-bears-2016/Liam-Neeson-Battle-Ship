class GameShip < ApplicationRecord
  has_and_belongs_to_many :coordinates

  validates :game_id, :player_id, :ship_id, presence: true
end
