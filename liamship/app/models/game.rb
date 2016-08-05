class Game < ApplicationRecord
  has_many :shots
  has_many :game_ships
  belongs_to :player_1, class_name: "User"
  belongs_to :player_2, class_name: "User", required: false
  belongs_to :winner, class_name: "User", required: false

  validates :player_1_id, presence: true

  def winner?
    game_ships_1 = dead_game_ships(self.player_1_id)
    game_ships_2 = dead_game_ships(self.player_2_id)
    if game_ships_1.count == 5
      self.winner_id = self.player_2_id
      return true
    elsif game_ships_2.count == 5
      self.winner_id = self.player_1_id
      return true
    else
      return false
    end
  end

  def dead_game_ships(player_id)
    ships = []
    possible_ships = GameShip.where(game_id: self.id, player_id: player_id)
    possible_ships.each do |ship|
      if ship.current_lives <= 0
        ships << ship
      end
    end
    ships
  end

end
