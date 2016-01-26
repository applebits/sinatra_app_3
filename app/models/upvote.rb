class Upvote < ActiveRecord::Base

  belongs_to :user
  belongs_to :song

  validates :user_id, uniqueness: true

end