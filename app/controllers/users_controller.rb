# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @party_users = PartyUser.attending(@user)
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to user_path(user)
    else
      flash[:error] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
