class CreateResponsibles < ActiveRecord::Migration
  def change
    create_table :responsibles do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :user, null: false

      t.timestamps null: false
    end

    add_index :responsibles, :user, unique: true
  end
end
