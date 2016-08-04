class User < ApplicationRecord
  has_many :shots
  has_many :games
  has_many :game_ships

  validates :name, presence: true, uniqueness: true
  validates :password, length: {minimum: 6}  
  has_secure_password

end
