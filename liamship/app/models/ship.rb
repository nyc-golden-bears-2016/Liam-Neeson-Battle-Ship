class Ship < ApplicationRecord
  has_many :game_ships

  validates :type, :lives, presence: true
end
