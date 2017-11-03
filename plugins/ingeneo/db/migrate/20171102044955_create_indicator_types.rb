class CreateIndicatorTypes < ActiveRecord::Migration
  def change
    create_table :indicator_types do |t|
      t.integer :subprocess_id, null: false
      t.integer :data_source_id, null: false
      t.string :name, null: false
      t.integer :active, null: false
      t.string :label_a, null: true
      t.string :label_b, null: true
      t.float :goal, null: false

      t.timestamps null: false
    end
    add_index :indicator_types, :name, unique: true
  end
end
