class HomeController < ApplicationController
	Tmdb::Api.key("d1a15870f12c8fa7845e143bc760eac3")

	def index
		@details=Tmdb::Movie.popular
    end	

    def show
		@movie= Tmdb::Movie.detail(params[:id])
        @items=current_user.my(@movie)
	end	

	def search
		if params[:search]
        @details=Tmdb::Search.movie(params[:search])
        @users=User.search(params[:search])
      
	end	
end


  def findfriends
   end

    def genre
    	@details=Tmdb::Genre.movies(params[:genre_id])
   end

   def toprated
   	@details=Tmdb::Movie.top_rated
   end

   def nowshowing
   	@details=Tmdb::Movie.now_playing
   end
   
   def upcoming
   	@details=Tmdb::Movie.upcoming
   end	

  def feed
      @friends=current_user.friends
 end
   	
end
