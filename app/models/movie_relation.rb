class MovieRelation < ApplicationRecord
	belongs_to :user
	validates :user_id, presence: true
  validates :movie_id, presence: true


   
end


