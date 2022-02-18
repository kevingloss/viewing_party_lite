# frozen_string_literal: true

class PartiesController < ApplicationController
  def new
    if !current_user
      flash[:alert] = 'you must be logged in/registered'
      redirect_to movie_path(params[:movie_id])
    else
      @user = User.find(session[:user_id])
      @users = User.except_user(@user.id)
      @movie = MovieDetailFacade.movie_details(params[:movie_id])
    end
  end

  def create
    user = User.find(session[:user_id])
    party = Party.new(party_params)
    movie = MovieDetailFacade.movie_details(params[:movie_id])
    if params[:duration].to_i >= movie.runtime && party.save
      PartyUser.create(user: user, party: party, status: :hosting)
      User.except_user(user.id).each do |user|
        PartyUser.create(user: user, party: party, status: :invited) if params[user.name.to_s] != ''
      end
      redirect_to dashboard_path # , params: {movie_id: params[:movie_id]}
    else
      flash[:alert] = 'Please check the duration is longer than the movie runtime.'
      redirect_to new_movie_party_path(party.movie_id)
    end
  end

  private

  def party_params
    params.permit(:duration, :date, :start_time, :movie_id)
  end
end
