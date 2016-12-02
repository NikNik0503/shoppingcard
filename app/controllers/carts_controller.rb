class CartsController < ApplicationController
  def show
    #@order = current_order
    #@order_items = @order.order_items
    @user = User.find(session[:user_id])
    @orders = @user.orders 
    @order = @orders.find_by_order_status_id(1)
    @order_items = @order.order_items
  end
end