class CastMemberFacade 
    class << self
        def starring(movie_id)
            response = CastMemberService.cast(movie_id)

            response.map do |data|
                CastMember.new(data)
            end
        end
    end
end