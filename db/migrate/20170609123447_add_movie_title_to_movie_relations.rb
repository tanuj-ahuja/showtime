class AddMovieTitleToMovieRelations < ActiveRecord::Migration[5.0]
  def change
    add_column :movie_relations, :movie_title, :string
  end
end
