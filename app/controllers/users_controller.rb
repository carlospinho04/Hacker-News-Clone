class UsersController < ApplicationController

  def new
  end

  def edit
    user = User.find_by_email(params[:email])
    if user && user.name == params[:name]
      if params[:password] == params[:password_confirmation]
        user.update_attribute(:password, params[:password])
        redirect_to '/login'
      end
    else
      redirect_to '/'
    end

  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end 

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
