class SessionsController < ApplicationController
  def new
    render 'login'
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      if @user.authenticate(params[:password])
        session[:player_id] = @user.id
        redirect_to (@user)
      else
        render 'login'
      end
    else
      @error = "User does not exist!"
      render 'login'
    end
  end

  def destroy
    session.delete(:player_id)
    redirect_to root_path
  end

end
