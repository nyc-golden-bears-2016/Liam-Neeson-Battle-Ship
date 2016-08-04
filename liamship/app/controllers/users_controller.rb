class UsersController < ActionController::Base
  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:user][:name])
    if @user.save
      session[:user_id] = @user.id
      redirect_to(@user)
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])

  end

end
