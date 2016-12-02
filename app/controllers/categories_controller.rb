class CategoriesController < ApplicationController
    
    def index
        @categories = Category.all
    end
    
    def show
       @category = Category.find(params[:id])
       @order_item = current_order.order_items.new
       @catproducts = @category.products.all
       @catpacks = @category.packages.all
    end
end
