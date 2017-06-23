class UsersController < ApplicationController
    
	def show
		@user=User.find(params[:id])
		@con1=Friendship.where(:user_id=>current_user.id).where(:friend_id=>params[:id])
		@con2=Friendship.where(:friend_id=>current_user.id).where(:user_id=>params[:id])
    
	end
	def confirm
	end	

    def myfriends
    	@friends=current_user.friends
    end
 
   def feed
      @movies1=current_user.movies1
      @movies2=current_user.movies2
 end

   def findfriends
   	if params[:search]
   		@users=User.search(params[:search])
    end
  end
   	
    

    

   
end
