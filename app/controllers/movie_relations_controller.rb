class MovieRelationsController < ApplicationController
	def create
		movie=params[:movie_id]
		movie_title=params[:movie_title]
		@mrel=MovieRelation.new(user_id: current_user.id,movie_id: movie,movie_title: movie_title)
		@mrel.save!
		redirect_to root_path
	end
	def mymovies 
       @movies=current_user.get_user_movies
	end	

	def destroy
		@movie=params[:id]
		@mdrel=current_user.finding(@movie)
        @mdrel.destroy(@mdrel.ids)
		
		redirect_to root_path
	end	
end
