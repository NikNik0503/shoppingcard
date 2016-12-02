class FrequenciesController < ApplicationController
    
    def index
        @frequencies = Frequency.all
        @package = Package.find(params[:package_id])
        @packproducts = @package.products.all 
    end
end
