class CreateItemLists < ActiveRecord::Migration
  def self.up
    create_table :item_lists do |t|
	  t.string :name
	  t.string :note
	  t.string :tag
	  t.integer :created_by
	  t.string :destination
	  t.datetime :deadline_at
	  t.integer :owned_by_corporation_id
	  t.string :list_type
	  
      t.timestamps
    end
    create_table :line_items do |t|
	  t.integer :item_id #evo issued id
	  t.string :name
	  t.integer :item_list_id #parent key
	  t.float :cost
	  t.integer :quantity
	  t.string :status
	  t.string :note
	  
      t.timestamps
    end

  end

  def self.down
    drop_table :item_lists
    drop_table :line_items
  end
end
