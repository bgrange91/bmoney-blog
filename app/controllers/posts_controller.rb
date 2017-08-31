class PostsController < ApplicationController
	# include AmazonSignature

	def index
		@posts = Post.all.order('created_at DESC')
	end

	def new
		@post = Post.new
		# @hash = AmazonSignature::data_hash
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_params)
		# @hash = AmazonSignature::data_hash

		if @post.save
			Follower.all.each do |follower|
				FollowerMailer.new_post(@post, follower).deliver
			end
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end
end