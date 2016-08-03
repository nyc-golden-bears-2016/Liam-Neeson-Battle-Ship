class ShotsController < ActionController::Base
  def new
    @shot = Shot.new
  end

  def create
    byebug
    @game = Game.find(params[:game_id])
    @coordinate = Coordinate.create(row: params[:coordinate][:row], column: params[:coordinate][:column])
    @shot = @game.shots.new(coordinate_id: @coordinate.id, player_id: session[:user_id])
    #logic for shot hit or miss
    if @shot.save
      redirect_to(@game)
    else
      render "new"
    end
  end

  def show
  end

end
