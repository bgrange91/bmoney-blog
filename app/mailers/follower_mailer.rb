class FollowerMailer < ApplicationMailer
	def new_post(post, follower)
		@post = post
		mail(to: follower.email, subject: 'New Post Added')
	end
end
