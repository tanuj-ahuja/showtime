class MovieRelationsController < ApplicationController
	attr_accessor :movie_id

	def create
		movie=params[:movie_id]
		movie_title=params[:movie_title]
		@mrel=MovieRelation.new(user_id: current_user.id,movie_id: movie,movie_title: movie_title)
		@mrel_id=@mrel.movie_id
	    respond_to do |format|

		  if @mrel.save
		  	format.html {redirect_to root_path}
		  	format.js
		  end

		 end
		 
		  			
		  
		
	
	
	end
	def mymovies 
       @movies=current_user.get_user_movies
	end	

	def destroy
		@movie=params[:id]
		@mdrel=MovieRelation.where(:user_id=>current_user.id).where(:movie_id=>params[:id])
		@md=MovieRelation.find(@mdrel.ids)
        @mdrel.destroy(@mdrel.ids)
        respond_to do |format|
		 format.html {redirect_to root_path}
		 format.js
		end
		
	end
	
	
end
