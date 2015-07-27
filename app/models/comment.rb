class Comment < ActiveRecord::Base
  belongs_to :post

  has_one :profile, :through => :user

  validates :content, presence: true, 
  					  length: {minimum: 1}
end
