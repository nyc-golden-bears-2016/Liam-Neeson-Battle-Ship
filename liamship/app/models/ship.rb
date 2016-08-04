class Ship < ApplicationRecord
  has_many :game_ships

  validates :type, :lives, presence: true
  validates :type, uniqueness: true
end
