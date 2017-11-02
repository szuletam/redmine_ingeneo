class CreateIndicatorLevels < ActiveRecord::Migration
  def change
    create_table :indicator_levels do |t|
      t.integer :indicator_type_id, :null => false
      t.integer :service_id, :null => false
      t.integer :subservice_id, :null => false
      t.integer :application_id, :null => true
      t.integer :app_module_id, :null => true

      t.timestamps :null => false
    end
  end
end
