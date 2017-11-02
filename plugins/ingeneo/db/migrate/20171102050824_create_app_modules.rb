class CreateAppModules < ActiveRecord::Migration
  def change
    create_table :app_modules do |t|
      t.integer :application_id, null: false
      t.string :name, null: false
      t.string :internal_code, null: false

      t.timestamps null: false
    end
    add_index :app_modules, :name, unique: true
  end
end
