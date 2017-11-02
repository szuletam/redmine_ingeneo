class CreateDataSources < ActiveRecord::Migration
  def change
    create_table :data_sources do |t|
      t.string :name, null: false
      t.string :description, null: true

      t.timestamps null: false
    end
    add_index :data_sources, :name, unique: true
  end
end
