class CreateSubprocesses < ActiveRecord::Migration
  def change
    create_table :subprocesses do |t|
      t.integer :macroprocess_id, null: false
      t.string :name, null: false
      t.string :internal_code, null: false

      t.timestamps null: false
    end
    add_index :subprocesses, :name, unique: true
  end
end
