class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :first_name
      t.string :last_name
      t.string :display_name, :null => false
      t.character :gender # null | M | F
      t.string :locale, :default => Cornerstone:Application.config.i18n.default_locale #en, de, es
      
      t.timestamps
    end
  end
end
