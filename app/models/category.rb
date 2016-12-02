class Category < ActiveRecord::Base
    has_many :characterizations, dependent: :destroy
    has_many :products, through: :characterizations
    has_many :packages, through: :characterizations 
end
