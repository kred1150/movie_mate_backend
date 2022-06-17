class RatedMoviesController < ApplicationController
  def create
    rated_movie = RatedMovie.new(
      rating: params[:rating],
      message: params[:message],
      user_id: params[:user_id],
      movie_id: params[:movie_id],
    )
    if rated_movie.save
      render json: rated_movie.as_json
    else
      render json: { errors: rated_movie.errors.full_messages }
    end
  end

  def index
    rated_movies = RatedMovie.all
    render json: rated_movies.as_json
  end
end
