class Post < ActiveRecord::Base
	belongs_to :user

	has_one :profile, :through => :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/ 

	validates :title, presence: true

	validates :content, presence: true 

	def self.search(query)
			where("title like ?", "%#{query}%")
		
	end
end
