
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Utilisateur créé !"
    else
      puts @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
end

private

def user_params
  params.require(:user).permit(:first_name, :last_name, :age, :email, :password, :password_confirmation, :city_id)
end
