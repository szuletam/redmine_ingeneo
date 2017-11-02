class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name, null: false
      t.string :internal_code, null: false

      t.timestamps null: false
    end
    add_index :applications, :name, unique: true
  end
end
