class RamblrCorporationsCharacters < ActiveRecord::Migration
  def self.up
    create_table :corporations do |t|
      t.integer :eveo_id
      t.string :name
      t.string :description
      
      t.timestamps
    end
    create_table :characters do |t|
      t.integer :eveo_id
      t.string :name
      t.integer :corporation
      t.integer :owning_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :corporations
    drop_table :characters
  end
end
