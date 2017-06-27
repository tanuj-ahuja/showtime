class FriendshipsController < ApplicationController
  def create
      @friendship = current_user.friendships.build(friend_id: params[:friend_id])
      respond_to do |format|
      if @friendship.save
        flash[:notice] = "Friend requested."
        format.html {redirect_to :back}
        format.js 
      
    
      else
        flash[:notice]="Friend request not send"
    
        format.html {redirect_to :back}
      end
      end
      
    end

    def update
      @friendship = Friendship.where(:user_id=>params[:id]).where(:friend_id=>current_user.id)
      @id=@friendship[0].user_id
      respond_to do |format| 
      if @friendship.update(accepted: true)
        format.html {redirect_to root_url, notice: "Successfully confirmed friend!"}
        format.js
      else
        format.html {redirect_to root_url, notice: "Sorry! Could not confirm friend!"}
      end
      end
    end

    def destroy
      @friendship = Friendship.where(:user_id=>params[:id]).where(:friend_id=>current_user.id)
      @friendship.destroy(@friendship.ids)
      flash[:notice] = "Removed friendship."
      redirect_to :back
    end
end
