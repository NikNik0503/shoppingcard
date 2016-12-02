class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end
  
  def new
    @product = Product.new
  end 
  
  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
  end
  
  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path
  end
  
  
   private

    def product_params
        params.require(:product).permit(:name, :price, category_ids: [])
    end
end