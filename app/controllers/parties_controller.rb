class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.except_user(@user.id)
    @movie = MovieDetailFacade.movie_details(params[:movie_id])
  end

  def create
    user = User.find(params[:user_id])
    party = Party.new(party_params)
    movie = MovieDetailFacade.movie_details(params[:movie_id])
    if params[:duration].to_i >= movie.runtime && party.save
      PartyUser.create(user: user, party: party, status: :hosting)
      User.except_user(user.id).each do |user|
        PartyUser.create(user: user, party: party, status: :invited) if params[user.name.to_s] != ''
      end
      redirect_to user_path(user) # , params: {movie_id: params[:movie_id]}
    else
      flash[:alert] = 'Please check the duration is longer than the movie runtime.'
      redirect_to new_user_movie_party_path(user, party.movie_id)
    end
  end

  private

  def party_params
    params.permit(:duration, :date, :start_time, :movie_id)
  end
end
