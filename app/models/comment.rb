class Comment < ActiveRecord::Base
  belongs_to :post

  has_one :profile, :through => :user
  
end
