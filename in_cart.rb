class Cart
@@cart =[]

  attr_accessor :name, :price, :total_cost

  @@total_cost = 0

  def initialize(name, price)
    @name = name
    @price = price
  end
  def self.all_in_cart
    @@cart
  end
  def add
    @@cart << self
  end

  def remove
    @@cart.delete(self)
  end

  def self.before_tax
    @@cart.each do |product|
      @@total_cost += product.price
    end
    return @@total_cost
  end

  def self.after_tax
    @@total_cost * 1.13
  end


end
# a=Cart.new("apple", 10)
# o=Cart.new("orange", 15)
# p Cart.all_in_cart
# puts a.add.inspect
# puts o.add.inspect
# # p Cart.all_in_cart
# # p a.remove
# p Cart.all_in_cart
# p Cart.before_tax
# p Cart.after_tax
