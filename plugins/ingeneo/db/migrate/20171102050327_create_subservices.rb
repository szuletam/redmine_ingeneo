class CreateSubservices < ActiveRecord::Migration
  def change
    create_table :subservices do |t|
      t.integer :service_id, null: false
      t.string :name, null: false
      t.string :internal_code, null: false

      t.timestamps null: false
    end
  end
end
