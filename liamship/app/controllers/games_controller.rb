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
    @player = whose_turn?(@game.id)
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

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update()
      redirect_to(@game)
    else
      render "edit"
    end
  end

  def whose_turn?(game_id)
    p1_shots = Shot.where(game_id: game_id, player_id: session[:player_id])
    p2_shots = Shot.where(game_id: game_id, player_id: enemy_player(game_id, Game.find_by(id: game_id).player_1_id))

    if p1_shots.count == 0 && p2_shots.count == 0
      return session[:player_id]
    elsif p1_shots.count > p2_shots.count
      return p2_shots.first.player_id
    else
      return p1_shots.first.player_id
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
