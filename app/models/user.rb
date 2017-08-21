class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :picture, PictureUploader
  validate  :picture_size
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :movie_relations,dependent: :destroy    

  has_many :friendships,dependent: :destroy
    has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id",dependent: :destroy

    has_many :active_friends, -> { where(friendships: { accepted: true}) }, through: :friendships, source: :friend
    has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
    has_many :pending_friends, -> { where(friendships: { accepted: false}) }, through: :friendships, source: :friend
    has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :user

# to call all your friends

    def friends
      active_friends | received_friends
    end

# to call your pending sent or received

    def pending
        pending_friends | requested_friendships
    end

  def my(other_movie) 
    MovieRelation.where("user_id=? AND movie_id=?",id,other_movie.id)
  end   

  def finding(movie)
   	 MovieRelation.where("user_id=? AND movie_id=?",id,movie)
   end	 

  def get_user_movies
    MovieRelation.where("user_id=?",id)
  end

  def movies1
   friend_ids="SELECT friend_id FROM friendships
                 WHERE user_id = :id AND accepted='t' "
   MovieRelation.where("user_id IN (#{friend_ids})",id: id)
  end  

  def movies2
    user_ids="SELECT user_id FROM friendships
               WHERE accepted='t' AND friend_id=:id"
    MovieRelation.where("user_id IN (#{user_ids})" ,id: id)
  end

 

  def self.search(search)
    where("name LIKE ?","%#{search}%")
  end

 private

def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

  


end
