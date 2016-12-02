class AddFieldsToBundle < ActiveRecord::Migration
  def change
    add_column :bundles, :amount, :integer
  end
end
