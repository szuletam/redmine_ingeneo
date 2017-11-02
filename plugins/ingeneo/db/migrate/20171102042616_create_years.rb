class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.integer :name, null: false

      t.timestamps null: false
    end
    add_index :years, :name, unique: true
  end
end
