class GameShip < ApplicationRecord
  has_and_belongs_to_many :coordinates
end
