require "pry"

class CashRegister
  
  attr_accessor :total, :last_transaction
  attr_reader :discount
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(title, price, quantity = 1)
    @last_transaction = (price * quantity)
    self.total += self.last_transaction
    quantity.times do
      @items << title
    end
  end
  
  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      self.total *= 1 - (self.discount.to_f / 100)
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end
  
  def items
    @items
  end
  
  def void_last_transaction
    self.total -= self.last_transaction
  end

end
