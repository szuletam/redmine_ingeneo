class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.string :internal_code, null: false

      t.timestamps null: false
    end
    add_index :services, :name, unique: true
  end
end
