class CreateIndicadors < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.integer :indicator_level_id, :null => false
      t.integer :indicator_type_id, :null => false
      t.integer :service_id, :null => false
      t.integer :subservice_id, :null => false
      t.integer :application_id, :null => true
      t.integer :app_module_id, :null => true
      t.integer :responsible_id, :null => true
      t.string :analysis_a, :null => false
      t.string :analysis_b, :null => true
      t.string :analysis_c, :null => true
      t.float :goal, :null => true
      t.float :service_weight, :null => true
      t.float :subservice_weight, :null => true
      t.float :application_weight, :null => true
      t.float :module_weight, :null => true
      t.datetime :date, :null => false
      t.integer :year_id, :null => false
      t.integer :month_id, :null => false
      t.integer :week_id, :null => false
      t.float :external_indicator_service, :null => true
      t.float :external_indicator_subservice, :null => true
      t.float :external_indicator_application, :null => true
      t.float :external_indicator_module, :null => true
      t.float :indicator_service, :null => false
      t.float :indicator_subservice, :null => true
      t.float :indicator_application, :null => true
      t.float :indicator_module, :null => true
      t.float :value_service_a, :null => true
      t.float :value_subservice_a, :null => true
      t.float :value_application_a, :null => true
      t.float :value_module_a, :null => true
      t.float :value_service_b, :null => true
      t.float :value_subservice_b, :null => true
      t.float :value_application_b, :null => true
      t.float :value_module_b, :null => true
      t.timestamps :null => false
    end
  end
end
