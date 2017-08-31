class FollowerMailer < ApplicationMailer
	def new_post(post)
		@post = post
		Follower.all.each do |follower|
			mail(to: follower.email, subject: 'New Post Added')
		end
	end
end
