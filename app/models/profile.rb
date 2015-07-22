class Profile < ActiveRecord::Base
	# attr_accessible :name, :username, :avatar, :description

	belongs_to :user

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ 
  	validates :username, presence: true,
  					     length: {minimum: 1},
  					     uniqueness: true
  	validates :name, presence: true,
  					 length: {minimum: 1},
  					 uniqueness: true
end
