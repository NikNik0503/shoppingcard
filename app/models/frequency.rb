class Frequency < ActiveRecord::Base
  belongs_to :product
  belongs_to :package
end
