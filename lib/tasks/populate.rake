namespace :db do
	desc "Erase and fill database"
	task :populate => :environment do
		require 'populator'
		require 'faker'

		[User, Profile, Post].each(&:delete_all)

		User.populate 10 do |user|
			user.email = Faker::Internet.email
			user.encrypted_password = Faker::Internet.password
			user.sign_in_count = 0
			user.created_at = Faker::Time.between(2.years.ago, Time.now, :all)

			Profile.populate 1 do |profile|
				profile.user_id = user.id
				profile.name = Faker::Name.name
				profile.username = Faker::Internet.user_name
				profile.description = Faker::Lorem.sentences(2)
				profile.avatar_file_name = Faker::Avatar.image
				
			end


			Post.populate 5 do |post|
				post.user_id = user.id
				post.title = Faker::Lorem.sentences
				post.content = Faker::Lorem.paragraphs (3)
				post.image_file_name = Faker::Avatar.image
				post.created_at = Faker::Time.between(2.years.ago, Time.now, :all)
			end
		end

		
	end

end