require 'rails_helper'

RSpec.describe MovieDetail do

  it 'has attributes' do
    data = {
      id: 1,
      title: "pirates",
      overview: "Story about pirates",
      vote_average: 9,
      genres: [{id: 7, name: 'adventure'}, {id: 9, name: 'fantasy'}],
      runtime: 160,
      poster_path: "/yHA9Fc37VmpUA5UncTxxo3rTGVA.jpg"
    }

    movie = MovieDetail.new(data)

    expect(movie).to be_a(MovieDetail)
    expect(movie.id).to eq(1)
    expect(movie.title).to eq('pirates')
    expect(movie.overview).to eq("Story about pirates")
    expect(movie.vote_average).to eq(9)
    expect(movie.runtime).to eq(160)
    expect(movie.genres).to eq("adventure, fantasy")
    expect(movie.poster_path).to eq('https://image.tmdb.org/t/p/original/yHA9Fc37VmpUA5UncTxxo3rTGVA.jpg')
  end

  it '#hr_min_runtime' do
    data = {
        id: 1,
        title: "pirates",
        overview: "Story about pirates",
        vote_average: 9,
        genres: [{id: 7, name: 'adventure'}, {id: 9, name: 'fantasy'}],
        runtime: 160
      }

      movie = MovieDetail.new(data)

      expect(movie.hr_min_runtime).to eq('2 hr 40 min')
  end
end
