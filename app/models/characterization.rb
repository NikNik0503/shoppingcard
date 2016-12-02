class Characterization < ActiveRecord::Base
  belongs_to :product
  belongs_to :category
  belongs_to :package
end
