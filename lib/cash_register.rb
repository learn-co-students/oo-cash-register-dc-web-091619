require 'pry'
class CashRegister
   attr_accessor :last_transaction_amount

    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction_amount = 0
   end

   def total=(value)
      @total = value
   end

   def discount=(value)
      @discount = value
   end

   def discount
      @discount
   end

   def total
      @total
   end

   def add_item(title, price, quantity=1)
      self.total += price * quantity
      quantity.times do
         @items << title
      end
      self.last_transaction_amount = price * quantity
   end

   def apply_discount
      if discount != 0
         self.total = (total * ((100.00 - discount.to_f)/100)).to_i
         "After the discount, the total comes to $#{self.total}."
      else
         "There is no discount to apply."
      end
   end

   def items=(list)
      @items = list
   end

   def items
      @items
   end
   def last_transaction_amount=(price)
      @last_transaction_amount = price
   end
   def last_transaction_amount
      @last_transaction_amount
   end
   def void_last_transaction
      self.total -= last_transaction_amount
   end
end
