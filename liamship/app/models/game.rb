class Game < ApplicationRecord
  has_many :shots
  has_many :game_ships
  belongs_to :player_1, class_name: "User"
  belongs_to :player_2, class_name: "User", required: false
  belongs_to :winner, class_name: "User", required: false

  validates :player_1_id, presence: true
end
