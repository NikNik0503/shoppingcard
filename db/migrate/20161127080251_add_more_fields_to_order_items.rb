class AddMoreFieldsToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :undis_total_price, :decimal, precision: 12, scale: 3
  end
end
