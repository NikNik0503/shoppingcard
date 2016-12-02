class AddFieldsToOrderItem < ActiveRecord::Migration
  def change
    add_column :order_items, :times, :integer
  end
end
