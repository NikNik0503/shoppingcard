class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    
    if !session[:user_id].nil?
      @user = User.find(session[:user_id])
      @orders = @user.orders 
      @current_order = @orders.find_by_order_status_id(1)
    else
      Order.new
    end
  end
  
  
end