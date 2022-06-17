class CreateRatedMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :rated_movies do |t|
      t.string :rating
      t.string :message
      t.integer :user_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
