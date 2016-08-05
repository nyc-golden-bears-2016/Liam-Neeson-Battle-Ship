class ShotsController < ApplicationController
  def new
    @shot = Shot.new
  end

  def create
    #current player method
    @game = Game.find(params[:game_id])
    if session[:player_id] == whose_turn?(@game.id)
      @coordinate = Coordinate.find_by(row: params[:coordinate][:row], column: params[:coordinate][:column])
      @shot = @game.shots.new(coordinate_id: @coordinate.id, player_id: session[:player_id])

      @shot.hit?(session[:player_id])
    else
      @shot = Shot.new #temporary line
      #redirect somewhere
    end
    if @shot.save
      redirect_to(@game)
    else
      # binding.pry
      # render "games/show"
      redirect_to(@game)
    end
  end

  def show
  end

  def whose_turn?(game_id)
    p1_shots = Shot.where(game_id: game_id, player_id: session[:player_id])
    p2_shots = Shot.where(game_id: game_id, player_id: enemy_player(game_id, Game.find_by(id: game_id).player_1_id))

    if p1_shots.count == 0 && p2_shots.count == 0
      return session[:player_id]
    elsif p1_shots.count > p2_shots.count
      return enemy_player(game_id, Game.find_by(id: game_id).player_1_id)
    else
      return session[:player_id]
    end
  end

  def enemy_player(game_id, player_id)
    game = Game.find_by(id: game_id)
    if player_id == game.player_1_id
      return enemy_id = game.player_2_id
    else
      return enemy_id = game.player_1_id
    end
  end
end
