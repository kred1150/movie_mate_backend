class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render json: @movies.as_json
  end

  def show
    movie = Movie.find_by(id: params[:id])
    stream_response = HTTP.get("https://api.themoviedb.org/3/movie/#{movie["external_id"]}/watch/providers?api_key=#{ENV["TMDB_API_KEY"]}")
    stream = JSON.parse(stream_response.body)["results"]["US"]
    cast_response = HTTP.get("https://api.themoviedb.org/3/movie/#{movie["external_id"]}/credits?api_key=#{ENV["TMDB_API_KEY"]}")
    cast = JSON.parse(cast_response.body)["cast"]
    videos_response = HTTP.get("https://api.themoviedb.org/3/movie/#{movie["external_id"]}/videos?api_key=#{ENV["TMDB_API_KEY"]}&language=en-US")
    videos = JSON.parse(videos_response.body)["results"]
    images_response = HTTP.get("https://api.themoviedb.org/3/movie/#{movie["external_id"]}/images?api_key=#{ENV["TMDB_API_KEY"]}")
    background_image = JSON.parse(images_response.body)["backdrops"][0]
    render json: { movie: movie.as_json, stream: stream.as_json, cast: cast.as_json, videos: videos.as_json, background_image: background_image.as_json }
  end
end
