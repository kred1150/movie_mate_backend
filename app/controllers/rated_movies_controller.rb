class RatedMoviesController < ApplicationController
  def create
    rated_movie = RatedMovie.new(
      rating: params[:rating],
      message: params[:message],
      user_id: current_user.id,
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

  def show
    rated_movie = RatedMovie.find_by(id: params[:id])
    render json: rated_movie.as_json
  end

  def destroy
    movie = RatedMovie.find_by(id: params[:id])
    if movie.user_id == current_user.id
      movie.destroy()
      render json: { message: "Rating successfully deleted!" }
    else
      render json: { message: "You can only delete a rating you created!" }, status: 401
    end
  end
end
