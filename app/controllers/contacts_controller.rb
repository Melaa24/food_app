class ContactsController < ApplicationController

  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:success] = 'Thank you for contacting Freashly Balanced.  We will respond to your message shortly.'
      redirect_to root_url
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end    
  end
end