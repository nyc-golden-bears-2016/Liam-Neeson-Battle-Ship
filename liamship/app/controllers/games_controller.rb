require 'json'

class GamesController < ApplicationController

  def index
    @games = Game.where(player_2_id: nil)
  end


  def show
    @game = Game.find(params[:id])
    @coordinate = Coordinate.new
    if @game.player_2_id == nil && current_user.id != @game.player_1_id
      @game.player_2_id = current_user.id
      @game.save
    end
    if @game.winner?
      #redirect to end game page
    end
    # if current_user.id != @game.player_1_id || current_user.id != @game.player_2_id
    #   redirect_to "index"
    # end
  end

  def turn
    @game = Game.find(params[:id])
    whose_turn?(@game.id) == session[:player_id] ? @player = true : @player = false
    # binding.pry
    render :json => @player
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(player_1_id: session[:player_id])
    if @game.save
      session[:player_id] = current_user.id
      redirect_to(@game)
    else
      render 'new'
    end
  end

  def whose_turn?(game_id)
    game = Game.find_by(id: game_id)
    p1_shots = Shot.where(game_id: game_id, player_id: game.player_1_id)
    p2_shots = Shot.where(game_id: game_id, player_id: game.player_2_id)
    # binding.pry
    p p1_shots.count
    p p2_shots.count

    if p1_shots.count == 0 && p2_shots.count == 0
      return game.player_1_id
    elsif p1_shots.count > p2_shots.count
      return game.player_2_id
    elsif p1_shots.count == p2_shots.count
      return game.player_1_id
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
