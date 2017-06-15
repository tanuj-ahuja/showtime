class CreateMovieRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_relations do |t|
      t.integer :user_id
      t.integer :movie_id

      t.timestamps
    end
    add_index :movie_relations, :user_id
    add_index :movie_relations, :movie_id
    add_index :movie_relations, [:user_id, :movie_id], unique: true
  
  end
end
