class FollowersController < ApplicationController
	def new
		@follower = Follower.new
	end

	def create
		@follower = Follower.new(follower_params)

		if @follower.save
			flash[:notice] = "You are now following this blog"
			redirect_to root_path
		else
			render 'new'
		end
	end

	private

	def follower_params
		params.require(:follower).permit(:email)
	end
end