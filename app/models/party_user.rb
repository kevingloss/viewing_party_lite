class PartyUser < ApplicationRecord
  belongs_to :user
  belongs_to :party

  enum status: {pending: 0, hosting: 1, invited: 2}

  def self.attending(user) 
    where(user_id: user.id)
  end

  def party_movie
    MovieDetailFacade.movie_details(self.party.movie_id)
  end
end
