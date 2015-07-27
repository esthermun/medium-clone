class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  #has_one :profile, :through => :user

  validates :content, presence: true, 
  					  length: {minimum: 2}
end
