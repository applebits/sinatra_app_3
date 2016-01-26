class Song < ActiveRecord::Base

  has_many :upvotes

  validates :title, presence: true, length: { maximum: 50 }
  validates :author, presence: true, length: { maximum: 50 }

end