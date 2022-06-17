# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
i = 1
# Pull API data for all movies
while i < 20
  response = HTTP.get("https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["TMDB_API_KEY"]}&language=en-US&page=#{i}")
  movies = JSON.parse(response.body)["results"]

  # Loop through API movie list to seed Movie Model
  movies.each do |movie|
    Movie.create(
      external_id: movie["id"],
      title: movie["title"],
      overview: movie["overview"],
      poster_path: "https://image.tmdb.org/t/p/w1280/" + movie["poster_path"],
      release_date: movie["release_date"],
      runtime: movie["runtime"],
      vote_average: movie["vote_average"],
      vote_count: movie["vote_count"],
    )
    # binding.pry
  end
  i += 1
end

# https://image.tmdb.org/t/p/w1280/
