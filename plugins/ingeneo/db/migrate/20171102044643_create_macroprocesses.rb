class CreateMacroprocesses < ActiveRecord::Migration
  def change
    create_table :macroprocesses do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
