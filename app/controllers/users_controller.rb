# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_user, only: :show
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(session[:user_id])
    @party_users = PartyUser.attending(@user)
  end

  def create
    user = User.new(user_params)

    if user.save
      flash[:success] = "Welcome, #{user.name}!"
      user.role = :user
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
