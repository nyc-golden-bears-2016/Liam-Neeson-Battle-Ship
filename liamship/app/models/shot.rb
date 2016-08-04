class Shot < ApplicationRecord
  belongs_to :coordinate
  belongs_to :player, class_name: "User"
  belongs_to :game

  validates :game_id, :coordinate_id, :hit?, :player_id, presence: true

  def hit?
    coordinate = Coordinate.find(self.coordinate_id)
    game_ships = GameShip.where(game_id: self.game_id, player_id: enemy_player(self.game_id))
    game_ships.each do |ship|
      if ship.coordinate_id == coordinate.id
        self.hit? = true
      end
    end
    self.hit? = false
  end

end
