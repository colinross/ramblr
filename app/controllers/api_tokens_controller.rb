class ApiTokensController < ApplicationController
  # GET /api_tokens/1
  # GET /api_tokens/1.xml
  def show
    @api_token = ApiToken.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @api_token }
    end
  end

  # GET /api_tokens/new
  # GET /api_tokens/new.xml
  def new
    @api_token = ApiToken.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @api_token }
    end
  end

  # POST /api_tokens
  # POST /api_tokens.xml
  def create
    @api_token = ApiToken.new(params[:api_token])
	@api_token.user = current_user
    respond_to do |format|
      if @api_token.save
        format.html { redirect_to('/dashboard#index', :notice => 'Eve api key was successfully created.') }
        format.xml  { render :xml => @api_token, :status => :created, :location => '/dashboard#index' }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @api_token.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /api_tokens/1
  # DELETE /api_tokens/1.xml
  def destroy
    @api_token = ApiToken.find(params[:id])
    
    @api_token.destroy unless @api_token.user_id != current_user.id

    respond_to do |format|
      format.html { redirect_to(api_tokens_url) }
      format.xml  { head :ok }
    end
  end
end
