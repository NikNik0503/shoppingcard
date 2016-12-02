class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :package
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  
  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    (unit_price-((((0.025*(quantity*quantity))+(0.25*quantity))/100)*unit_price))*quantity
  end
  
  def undis_total_price
    unit_price*quantity
  end


private
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end


  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = total_price
    self[:undis_total_price] = quantity * self[:unit_price]
  end
end