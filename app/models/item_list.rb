class ItemList < ActiveRecord::Base
	has_many :LineItems, :dependent => :destroy
	accepts_nested_attributes_for :LineItems, :reject_if => :all_blank
	attr_accessor :line_items_attribute
	def to_s
	  self.name
	end
end
