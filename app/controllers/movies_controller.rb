class MoviesController < ApplicationController
  # def index
  #   response = HTTP.get("https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["TMDB_API_KEY"]}&language=en-US")
  #   # poster path = "https://image.tmdb.org/t/p/w1280/#{poster_path}"
  #   movies = JSON.parse(response.body)["results"]
  #   render json: movies.as_json
  # end

  # def show
  #   response = HTTP.get("https://api.themoviedb.org/3/movie/#{params[:id]}?api_key=#{ENV["TMDB_API_KEY"]}&language=en-US")
  #   movie = JSON.parse(response.body)
  #   render json: movie.as_json
  # end

  def index
    movies = Movie.all
    render json: movies.as_json
  end

  def show
    movie = Movie.find_by(id: params[:id])
    stream_response = HTTP.get("https://api.themoviedb.org/3/movie/#{movie["external_id"]}/watch/providers?api_key=#{ENV["TMDB_API_KEY"]}")
    stream = JSON.parse(stream_response.body)["results"]["US"]
    cast_response = HTTP.get("https://api.themoviedb.org/3/movie/#{movie["external_id"]}/credits?api_key=#{ENV["TMDB_API_KEY"]}")
    cast = JSON.parse(cast_response.body)["cast"]
    render json: { movie: movie.as_json, stream: stream.as_json, cast: cast.as_json }
  end
end
