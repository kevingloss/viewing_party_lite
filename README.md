# Viewing Party Lite

The base repo for the [Viewing Party Lite Project](https://backend.turing.io/module3/projects/viewing_party_lite) is used for Turing's Backend Module 3 and was built over the course of 5 days.

### About this Project

Viewing Party Lite is an application in which users can explore movie options and create a viewing party event for themselves and other users of the application. The information for this application comes from consuming the endpoints of the [The Movie Database API](https://www.themoviedb.org/).

### Authors:
 - [Kevin Gloss](https://github.com/kevingloss)
 - [Eldridge Turambi](https://github.com/Eldridge-Turambi)

## Local Setup
This project was built with Ruby 2.7.2 & Rails 5.2.6, and may need to be updated for different versions.

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{create,migrate}`

## Endpoint Documentation

- Top Rated Movies
  - Returns the movies sorted by the best ratings, our app limits it to 40 responses.
  - Example Request: `https://api.themoviedb.org/3/movie/top_rated`
  - Example Response: 
  ```json
  {
    "page": 1,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/v5CEt88iDsuoMaW1Q5Msu9UZdEt.jpg",
            "genre_ids": [
                10749,
                18
            ],
            "id": 730154,
            "original_language": "ja",
            "original_title": "きみの瞳が問いかけている",
            "overview": "A tragic accident lead to Kaori's blindness, but she clings to life and the smaller pleasures it can still afford her. She meets Rui and begins to talk to him. Rui was once a promising kickboxer, but something happened in his past. Kaori's smile brings out a change in Rui. However, the two are connected in more than one way. Rui attempts to do what is right.",
            "popularity": 12.649,
            "poster_path": "/cVn8E3Fxbi8HzYYtaSfsblYC4gl.jpg",
            "release_date": "2020-10-23",
            "title": "Your Eyes Tell",
            "video": false,
            "vote_average": 8.8,
            "vote_count": 224
        },
  
 - Search Movies by Title
   - Allows a user to put in a keyword to search by and limits the results to 40 responses.
   - Example Request: `https://api.themoviedb.org/3/search/movie?language=en-US&query=star wars`
  - Example Response: 
  ```json
  "page": 1,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/zqkmTXzjkAgXmEWLRsY4UpTWCeo.jpg",
            "genre_ids": [
                12,
                28,
                878
            ],
            "id": 11,
            "original_language": "en",
            "original_title": "Star Wars",
            "overview": "Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.",
            "popularity": 96.335,
            "poster_path": "/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg",
            "release_date": "1977-05-25",
            "title": "Star Wars",
            "video": false,
            "vote_average": 8.2,
            "vote_count": 16645
        },
  ```
 - Movie Details
   - Returns more detailed information for one movie.
   - Example Request: `https://api.themoviedb.org/3/movie/11`
   - Example Response:
   ```json
    {
    "adult": false,
    "backdrop_path": "/zqkmTXzjkAgXmEWLRsY4UpTWCeo.jpg",
    "belongs_to_collection": {
        "id": 10,
        "name": "Star Wars Collection",
        "poster_path": "/tdQzRSk4PXX6hzjLcQWHafYtZTI.jpg",
        "backdrop_path": "/d8duYyyC9J5T825Hg7grmaabfxQ.jpg"
    },
    "budget": 11000000,
    "genres": [
        {
            "id": 12,
            "name": "Adventure"
        },
        {
            "id": 28,
            "name": "Action"
        },
        {
            "id": 878,
            "name": "Science Fiction"
        }
    ],
    "homepage": "http://www.starwars.com/films/star-wars-episode-iv-a-new-hope",
    "id": 11,
    "imdb_id": "tt0076759",
    "original_language": "en",
    "original_title": "Star Wars",
    "overview": "Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.",
    "popularity": 96.335,
    "poster_path": "/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg",
    "production_companies": [
        {
            "id": 1,
            "logo_path": "/o86DbpburjxrqAzEDhXZcyE8pDb.png",
            "name": "Lucasfilm",
            "origin_country": "US"
        },
        {
            "id": 25,
            "logo_path": "/qZCc1lty5FzX30aOCVRBLzaVmcp.png",
            "name": "20th Century Fox",
            "origin_country": "US"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "1977-05-25",
    "revenue": 775398007,
    "runtime": 121,
    "spoken_languages": [
        {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
        }
    ],
    "status": "Released",
    "tagline": "A long time ago in a galaxy far, far away...",
    "title": "Star Wars",
    "video": false,
    "vote_average": 8.2,
    "vote_count": 16647
    }
   ```
   
 - Movie Credits
   - This endpoint was used to gather information about the actors/actresses starring in the movie.
   - Example Request: `https://api.themoviedb.org/3/movie/704264/credits`
   - Example Response:
   ```json
   {
    "id": 704264,
    "cast": [
        {
            "adult": false,
            "gender": 2,
            "id": 1218986,
            "known_for_department": "Writing",
            "name": "Bryan Andrews",
            "original_name": "Bryan Andrews",
            "popularity": 3.321,
            "profile_path": null,
            "cast_id": 1,
            "character": "",
            "credit_id": "5ebd960815a4a1001c9c7e4d",
            "order": 1
        },
   ```
 - Movie Reviews
   - This endpoint was used to gather information about movie reviews.
   - Example Request: `https://api.themoviedb.org/3/movie/49051/reviews`
   - Example Response:
   ```json
   "id": 49051,
    "page": 1,
    "results": [
        {
            "author": "Andres Gomez",
            "author_details": {
                "name": "Andres Gomez",
                "username": "tanty",
                "avatar_path": "/https://secure.gravatar.com/avatar/03a53cd53b8254fe582d4fe1acc26c4e.jpg",
                "rating": 6.5
            },
            "content": "Peter Jackson creates the same world that he already shown us in the LOTR, but that's not the only thing he repeats.\r\n\r\nHe also repeats ripping Tolkiens book into a sucession of endless races and actions scenes with orcs falling everywhere and several \"inventions\" that mess the beautiful story created by the English author.\r\n\r\nHe also repeats those several minutes of platform game inside caves that we saw in Moria and in his version of King Kong.\r\n\r\nIf you loved the previous movies from Jackson, you will love this too.\r\n\r\nIf you are looking for some quality, you will only finding in the re-creation of the Middle Earth and the peformances of Ian McKellen, Martin Freeman and Cate Blanchett.",
            "created_at": "2012-12-17T11:34:24.128Z",
            "id": "50cf0340760ee310f513d014",
            "updated_at": "2021-06-23T15:57:20.448Z",
            "url": "https://www.themoviedb.org/review/50cf0340760ee310f513d014"
        },
   ```
Example wireframes to follow are found [here](https://backend.turing.io/module3/projects/viewing_party_lite/wireframes)
