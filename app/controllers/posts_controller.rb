class PostsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user
  
  def new
    @post = Post.new
  end

  def create
  	@post = current_user.posts.build(post_params)
  	if @post.save
  	  flash[:success] = "Post created!"
  	  redirect_to root_url
  	else
      render new_post_path
  	end
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end