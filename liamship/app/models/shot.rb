class Shot < ApplicationRecord
  belongs_to :coordinate
  belongs_to :player, class_name: "User"
  belongs_to :game

  validates :game_id, :coordinate_id, :hit?, :player_id, presence: true
end
