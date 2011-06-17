class CreateApiTokens < ActiveRecord::Migration
  def self.up
    create_table :api_tokens do |t|
      t.integer  :eveo_user_id
      t.string   :eveo_api_key
      t.string   :token_scope
      t.string   :token_level
      t.datetime :last_valid
      t.integer  :user_id
      t.string   :accessible_entities

      t.timestamps
    end
  end

  def self.down
    drop_table :api_tokens
  end
end
