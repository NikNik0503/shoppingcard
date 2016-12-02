class BundlesController < ApplicationController
    def index
        @package = Package.find(params[:package_id])
        @bundles = Bundle.where(package_id: @package.id)
    end
    
    def show
        @bundle = Bundle.find(params[:id])
    end
    
    def edit
     @bundle = Bundle.find(params[:id])
    end
    
   
    def update
      @bundle = Bundle.find(params[:id])
     @package = @bundle.package_id
      if @bundle.update(bundle_params)
          @product = @bundle.product_id
          @productprice = Product.find_by(id: @product).price
         @bundle.bundleprice = @bundle.amount * @productprice
         @bundle.update(bundle_params)
         @thepackage = Package.find_by(id: @package)
         @packprice =  @thepackage.bundles.sum(:bundleprice)
         @thepackage.packageprice = @packprice 
         @thepackage.save 
            
         
        @redirect = @bundle.package.id
        redirect_to package_path(@redirect), notice: "Account successfully updated!"
      else
        render :edit
      end
    end

    private

    def bundle_params
        params.require(:bundle).permit(:amount)
    end


end
