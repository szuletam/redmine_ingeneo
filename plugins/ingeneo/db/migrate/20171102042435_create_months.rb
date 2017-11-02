class CreateMonths < ActiveRecord::Migration
  def change
    create_table :months do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :months, :name, unique: true
  end
end
