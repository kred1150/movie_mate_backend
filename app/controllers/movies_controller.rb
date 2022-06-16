class MoviesController < ApplicationController
  def index
    response = HTTP.get("https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["TMDB_API_KEY"]}&language=en-US")
    # poster path = "https://image.tmdb.org/t/p/w1280/#{poster_path}"
    movies = JSON.parse(response.body)["results"]
    render json: movies.as_json
  end

  def show
    response = HTTP.get("https://api.themoviedb.org/3/movie/#{params[:id]}?api_key=#{ENV["TMDB_API_KEY"]}&language=en-US")
    movie = JSON.parse(response.body)
    render json: movie.as_json
  end
end
