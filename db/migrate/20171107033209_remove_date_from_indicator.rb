class RemoveDateFromIndicator < ActiveRecord::Migration
  def change
    remove_column :indicators, :date
  end
end
