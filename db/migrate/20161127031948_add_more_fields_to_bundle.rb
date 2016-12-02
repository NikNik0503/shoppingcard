class AddMoreFieldsToBundle < ActiveRecord::Migration
  def change
    add_column :bundles, :bundleprice, :decimal, precision: 12, scale: 3
  end
end
