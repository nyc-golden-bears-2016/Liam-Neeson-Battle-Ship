module GamesHelper

  def enemy_player(game_id)
    game = Game.find_by(id: game_id)
    if session[:player_id] == game.player_1_id
      return enemy_id = game.player_2_id
    else
      return enemy_id = game.player_1_id
    end
  end

  def whose_turn?(game_id)
    p1_shots = Shots.where(game_id: game_id, player_id: session[:player_id])
    p2_shots = Shots.where(game_id: game_id, player_id: enemy_player(game_id))
    if p1_shots.count > p2_shots.count
      return p2_shots.first.player_id
    else
      return p1_shots.first.player_id
    end
  end

end
