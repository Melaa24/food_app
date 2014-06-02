class StaticPagesController < ApplicationController
  def home
  	@user = User.find_by(params[:admin])
  	@posts = @user.posts.paginate(page: params[:page])
  end

  def about
  end

  def contact
  end
end
