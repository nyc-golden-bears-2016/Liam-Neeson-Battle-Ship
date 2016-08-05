class GameShip < ApplicationRecord
  has_and_belongs_to_many :coordinates
  belongs_to :ship
  belongs_to :player, class_name: "User"

  validates :game_id, :player_id, :ship_id, presence: true
  validates :current_lives, presence: true

  before_validation :set_lives
  before_save :set_lives

  def set_lives
    self.current_lives = self.ship.lives if self.current_lives.nil?
  end

end
