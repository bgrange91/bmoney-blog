class BlogsController < ApplicationController
	def show
    @blog = UserBlog.find(params[:id])
  end

  def new
    @blog = UserBlog.new
  end

  def create
  	debugger
    @blog = UserBlog.new(blog_params)
    if @blog.save
      redirect_to root_path, alert: "Blog has been successfully created"
    else
      render 'new'
    end
  end

  private

    def blog_params
      params.require(:user_blog).permit(:user_id, :name, :description, :visible)
    end
end
