class CastMemberService < ApiService
    class << self
        def starring(movie_id)
            response = connection.get("/movie#{movie_id}/credits")
            parse_json(response)
        end
    end
end