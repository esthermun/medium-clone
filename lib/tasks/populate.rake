namespace :db do
	desc "Erase and fill database"
	task :populate => :environment do
		require 'populator'
		require 'faker'

		[User, Profile, Post].each(&:delete_all)

		User.populate 30 do |user|
			user.email = Faker::Internet.email
			user.password = Faker::Internet.password(8)
		end

		Profile.populate 30 do |profile|
			profile.name = Faker::Name.name
			profile.username = Faker::Internet.user_name
			profile.description = Faker::Lorem.sentences(2)
			profile.avatar = Faker::Avatar.image("my-own-slug", "750x500", "jpg")
		end

		Post.pouplate 50 do |post|
			post.title = Faker::Lorem.sentences
			post.content = Faker::Lorem.paragraphs (3)
			post.image = Faker::Avatar.image
			post.created_at = Faker::Time.between(2.years.ago, Time.now, :all)
		end
	end

end