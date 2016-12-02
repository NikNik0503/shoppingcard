class PackagesController < ApplicationController
    
    def index
       @packages = Package.all 
       
  
    end
    
    def show
        @package = Package.find(params[:id])
        @packproducts = @package.products.all 
        @order_item = current_order.order_items.new
        @value = 3    
        @bundles = Bundle.where(package_id: @package.id)
    end
    
    def new
        @package = Package.new
    end 
    
    def create
        @package = Package.new(package_params)
        @package.save
        redirect_to package_path(@package)
    end
    
    def edit
        @package = Package.find(params[:id])
        @bundles = Bundle.where(package_id: @package.id).all
        #@package = Package.find(params[:id])
        #@packproducts = @package.products.all 
        #@order_item = current_order.order_items.new
        #@value = current_order.order_items.all 
       
    end
  
  
   private

    def package_params
        params.require(:package).permit(:name, product_ids: [], category_ids: [])
    end


  
end
