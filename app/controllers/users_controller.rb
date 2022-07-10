class UsersController < ApplicationController
  def create
    user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if user.save
      render json: { message: "User successfully created!" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def index
    users = User.all
    render json: users.as_json
  end

  def show
    user = User.find_by(id: params[:id])
    rated_movies = RatedMovie.where(user_id: user.id)
    render json: { user: user.as_json, ratings: rated_movies.as_json }
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user.id == current_user.id
      user.destroy()
      render json: { message: "User successfully deleted!" }
    else
      render json: { message: "You can only delete a profile you created!" }, status: 401
    end
  end
end
