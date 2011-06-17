class ItemListsController < ApplicationController
  # GET /item_lists
  # GET /item_lists.xml
  def index
	logger.debug { "fix this link! ItemLists#index is deprecated" }
  end

  # GET /item_lists/1
  # GET /item_lists/1.xml
  def show
    @item_list = ItemList.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item_list }
    end
  end

  # GET /item_lists/new
  # GET /item_lists/new.xml
  def new
    @item_list = ItemList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item_list }
    end
  end

  # GET /item_lists/1/edit
  def edit
    @item_list = ItemList.find(params[:id])
  end

  # POST /item_lists
  # POST /item_lists.xml
  def create
    @item_list = ItemList.new(params[:item_list])
	@item_list.created_by = current_user.id
	
    respond_to do |format|
      if @item_list.save
        format.html { redirect_to(@item_list, :notice => 'Item list was successfully created.') }
        format.xml  { render :xml => @item_list, :status => :created, :location => @item_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /item_lists/1
  # PUT /item_lists/1.xml
  def update
    @item_list = ItemList.find(params[:id])

    respond_to do |format|
      if @item_list.update_attributes(params[:item_list])
        format.html { redirect_to(@item_list, :notice => 'Item list was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /item_lists/1
  # DELETE /item_lists/1.xml
  def destroy
    @item_list = ItemList.find(params[:id])
    @item_list.destroy

    respond_to do |format|
      format.html { redirect_to(:dashboard) }
      format.xml  { head :ok }
    end
  end
end
