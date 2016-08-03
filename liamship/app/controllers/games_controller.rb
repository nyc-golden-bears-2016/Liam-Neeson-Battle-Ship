class GamesController < ApplicationController

  def index
    @games = Game.where(player_2_id: null)
  end

  def show
    @game = Game.find(params[:id])
    #If current_user.id != session[:player_1] || session[:player_2]
      #redirect_to "index"
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(player_1_id: current_user.id)
    if @game.save
      session[:game_id] = @game.id
      redirect_to(@game)
    else
      render '#new'
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
