class ActorsController < ApplicationController
  def show
    actor_id = params[:id]
    profile = HTTP.get("https://api.themoviedb.org/3/person/#{actor_id}?api_key=#{ENV["TMDB_API_KEY"]}")
    known_for = HTTP.get("https://api.themoviedb.org/3/person/#{actor_id}/movie_credits?api_key=#{ENV["TMDB_API_KEY"]}")

    bio = JSON.parse(profile.body)["biography"]
    birthday = JSON.parse(profile.body)["birthday"]
    deathday = JSON.parse(profile.body)["deathday"]
    name = JSON.parse(profile.body)["name"]
    birthplace = JSON.parse(profile.body)["place_of_birth"]
    profile_path = JSON.parse(profile.body)["profile_path"]

    render json: { bio: bio.as_json, birthday: birthday.as_json, deathday: deathday.as_json, name: name.as_json, birthplace: birthplace.as_json, profile_path: profile_path.as_json }
  end
end
