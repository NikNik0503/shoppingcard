class Package < ActiveRecord::Base
has_many :order_items
has_many :bundles, dependent: :destroy
has_many :products, through: :bundles
has_many :characterizations, dependent: :destroy
has_many :categories, through: :characterizations
    
end
