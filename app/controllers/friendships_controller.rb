class FriendshipsController < ApplicationController
  def create
      @friendship = current_user.friendships.build(friend_id: params[:friend_id])
      if @friendship.save
        flash[:notice] = "Friend requested."
        redirect_to :back
      else
        flash[:error] = "Unable to request friendship."
        redirect_to :back
      end
    end

    def update
      @friendship = Friendship.where(:user_id=>params[:id]).where(:friend_id=>current_user.id)
      if @friendship.update(accepted: true)
      
        redirect_to root_url, notice: "Successfully confirmed friend!"
      else
        redirect_to root_url, notice: "Sorry! Could not confirm friend!"
      end
    end

    def destroy
      @friendship = Friendship.where(:user_id=>params[:id]).where(:friend_id=>current_user.id)
      @friendship.destroy(@friendship.ids)
      flash[:notice] = "Removed friendship."
      redirect_to :back
    end
end
