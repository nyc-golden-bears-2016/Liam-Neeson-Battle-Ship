class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # def enemy_player(game_id)
  #   game = Game.find_by(id: game_id)
  #   if session[:player_id] == game.player_1_id
  #     return enemy_id = game.player_2_id
  #   else
  #     return enemy_id = game.player_1_id
  #   end
  # end

  # def enemy_player(game_id, player_id)
  #   game = Game.find_by(id: game_id)
  #   if player_id == game.player_1_id
  #     return enemy_id = game.player_2_id
  #   else
  #     return enemy_id = game.player_1_id
  #   end
  # end

  def logged_in?
    User.exists?(session[:player_id])
  end

  def current_user
    if logged_in?
      current_user = User.find(session[:player_id])
    end
  end

end
