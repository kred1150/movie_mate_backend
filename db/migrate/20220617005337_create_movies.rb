class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.integer :external_id
      t.string :title
      t.text :overview
      t.string :poster_path
      t.string :release_date
      t.integer :runtime
      t.decimal :vote_average, precision: 3, scale: 1
      t.integer :vote_count

      t.timestamps
    end
  end
end
