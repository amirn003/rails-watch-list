# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

require "json"
require "open-uri"

url = "https://tmdb.lewagon.com/movie/top_rated"
movie_serialized = URI.open(url).read
movie = JSON.parse(movie_serialized)

url = "https://image.tmdb.org/t/p/w500"

20.times do |n|
  title_tmdb = movie["results"][n]["original_title"]
  next unless title_tmdb.match(/^[a-zA-Z0-9_\-+ ]*$/)

  overview_tmdb = movie["results"][n]["overview"]
  poster_path = movie["results"][n]["poster_path"]
  poster_url_tmdb = "#{url}/#{poster_path}"
  rating_tmdb = movie["results"][n]["vote_average"]

  #p title_tmdb, overview_tmdb, poster_url_tmdb, rating_tmdb
  Movie.create(title: title_tmdb, overview: overview_tmdb, poster_url: poster_url_tmdb, rating: rating_tmdb)
end
