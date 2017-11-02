class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :name, null: false

      t.timestamps null: false
    end

    add_index :weeks, :name, unique: true
  end
end
