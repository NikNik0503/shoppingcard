class AddFieldsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :value, :integer
  end
end
