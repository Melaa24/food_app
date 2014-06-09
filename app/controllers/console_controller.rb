class ConsoleController < ApplicationController
  before_action :admin_user, only: [:show]

  def new
  end

  def show
  	@user = User.find(params[:id])
  end
end