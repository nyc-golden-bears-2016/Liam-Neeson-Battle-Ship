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

    # if whose_turn?(@game.id) == session[:player_id]

    # If current_user.id != @game.player_1_id || current_user.id != @game.player_2_id
    #   redirect_to "index"
    # end
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(player_1_id: session[:user_id])
    if @game.save
      session[:player_id] = current_user.id
      # byebug
      gameship = GameShip.new(player_id: session[:user_id], game_id: @game.id, ship_id: 1)
      byebug
      4.times { |i| gameship.coordinates << Coordinate.find_by(id: i+1)}
      gameship.save

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

end
