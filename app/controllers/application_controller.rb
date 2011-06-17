class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :html, :xml, :json
  
  def index
    if user_signed_in? then redirect_to :controller => "dashboard", :action => "index"
	elsif request.headers['HTTP_EVE_TRUSTED'] == 'Yes'
	  login_via_igb
	elsif request.headers['HTTP_USER_AGENT'].match('EVE-IGB')
	  redirect_to :action => "request_trust"
	else
	  login_via_oog
	end
  end
  
  def request_trust
  	logger.info 'Requesting Trust'
    render :layout => false
  end
  def login_via_igb
  	logger.info 'Prompting login via IGB'
  	
  	character_in_system = Character.find(request.headers['HTTP_EVE_CHARID'])
	if character_in_system
  	  prime_email = User.find_email_by_character_id request.headers['HTTP_']
	  logger.info "Character registered to user with email () "

  	  #redirect_to :new_user_session, :email => prime_email
	else
	  logger.info 'Character not registered, redirecting to generic login'
	  redirect_to :new_user_session
	end
  end
  def login_via_oog
  	logger.info 'Prompting login via OOG'
    redirect_to :new_user_session
  end
end
 