class LineItem < ActiveRecord::Base
	belongs_to :ItemList ## item_list_id
	
end
