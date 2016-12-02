class OrderItemsController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @orders = @user.orders 
    @order = @orders.find_by_order_status_id(1)
    @order_item = @order.order_items.new(order_item_params)
    @order.user = User.find(session[:user_id])
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @user = User.find(session[:user_id])
    @orders = @user.orders 
    @order = @orders.find_by_order_status_id(1)
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @user = User.find(session[:user_id])
    @orders = @user.orders 
    @order = @orders.find_by_order_status_id(1)
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end
private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end