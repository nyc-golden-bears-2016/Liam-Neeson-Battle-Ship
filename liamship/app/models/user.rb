class User < ApplicationRecord
  has_many :shots
  has_many :games
  has_many :game_ships

  validates :name, presence: true, uniqueness: true
end
