class Shot < ApplicationRecord
  belongs_to :coordinate
  belongs_to :player, class_name: "User"
  belongs_to :game

  validates :game_id, :coordinate_id, :hit, :player_id, presence: true

  validates :coordinate_id, uniqueness: { scope: [:player_id, :game_id] }

  def enemy_player(game_id, player_id)
    game = Game.find_by(id: game_id)
    enemy_id = game.player_1_id
    if player_id == game.player_1_id
      enemy_id = game.player_2_id
    end
    enemy_id
  end

  def hit?(current_player_id)
    self.hit = false
    coordinate = self.coordinate
    game_ships = GameShip.where(game_id: self.game_id, player_id: enemy_player(self.game_id, current_player_id))
    game_ships.each do |ship|

      ship.coordinates.each do |shipcoords|
        if shipcoords.id == coordinate.id
          self.hit = true
          ship.current_lives = ship.current_lives - 1
          ship.save
          return true
        end
      end
    end
    return false
  end

end
