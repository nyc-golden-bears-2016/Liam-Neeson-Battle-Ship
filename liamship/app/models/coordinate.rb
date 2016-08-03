class Coordinate < ApplicationRecord
  has_and_belongs_to_many :game_ships
  has_many :shots

  validates :row, :column, presence: true
end
