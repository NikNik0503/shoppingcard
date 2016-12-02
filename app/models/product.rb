class Product < ActiveRecord::Base
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
  has_many :order_items
  has_many :bundles, dependent: :destroy
  has_many :packages, through: :bundles
  has_many :characterizations, dependent: :destroy
  has_many :categories, through: :characterizations

  default_scope { where(active: true) }
end