class DashboardController < ApplicationController
	def index
	  @user = current_user
	  @item_lists = ItemList.find_all_by_created_by(current_user.id)
	end
end
