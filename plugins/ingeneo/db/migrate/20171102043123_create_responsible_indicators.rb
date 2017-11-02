class CreateResponsibleIndicators < ActiveRecord::Migration
  def change
    create_table :responsible_indicators do |t|
      t.integer :indicator_type_id, null: false
      t.integer :responsible_id, null: false
      t.integer :active, null: true

      t.timestamps null: false
    end
  end
end
