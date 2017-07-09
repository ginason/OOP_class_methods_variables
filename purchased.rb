require_relative 'in_cart.rb'

class Purchased_product


  def initialize
  end

  def self.total_price
    Cart.after_tax

  end
end


p Purchased_product.total_price
