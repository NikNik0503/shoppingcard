class MakeOrdersAJoinTable < ActiveRecord::Migration
  def up
    Order.delete_all
    add_column    :orders, :user_id, :integer
  end 

  def down
    Order.delete_all
    remove_column :orders, :user_id
  end
end
