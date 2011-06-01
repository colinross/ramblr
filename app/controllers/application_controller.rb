class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :html, :xml, :json
 # before_filter autheticate_user!
  
  def index
    render 
  end
end
