class PartiesController < ApplicationController 
    def new 
        @user = User.find(params[:user_id])
        @users = User.except_user(@user.id)
        @movie = MovieDetailFacade.movie_details(params[:movie_id])
    end

    def create 
        user = User.find(params[:user_id])
        party = Party.create(party_params)
        PartyUser.create(user: user, party: party, status: :hosting)
        User.except_user(user.id).each do |user|
            if params["#{user.name}"] != ''
                PartyUser.create(user: user, party: party, status: :invited)
            end
        end
        
        redirect_to user_path(user), params: {movie_id: params[:movie_id]}
    end

    private 
      def party_params 
        params.permit(:duration, :date, :start_time, :movie_id)
      end
end