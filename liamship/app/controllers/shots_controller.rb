class ShotsController < ActionController::Base
  def new
    @shot = Shot.new
  end

  def create
    @game = Game.find(params[:game_id])
    @shot = @game.shots.new(shot_params)
    if @shot.save
      redirect_to(@game)
    else
      render "new"
    end
  end

end
