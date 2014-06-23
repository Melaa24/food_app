class StaticPagesController < ApplicationController
  def home
  	@user = User.find_by(params[:admin])
  	@posts = Post.paginate(page: params[:page])
  end

  def about
  end

  def workshop
  end
end
