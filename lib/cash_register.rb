class CashRegister

      attr_accessor :total, :discount, :title, :item, :last_transaction
  
  
      def initialize(discount=0)
          @total = 0
          @item = []
          @discount = discount
      end
    
      # default quantity should be 1!
      # items with same name still should be added on the item list, so do "quantity.times"
      # need to call last_transaction here because only add_item can track what was the last
      # item added on the list
      def add_item(title, price, quantity=1)
          self.total += price * quantity
          quantity.times do
          @item << title
          end
          self.last_transaction = price * quantity
      end
  
      def apply_discount
          if @discount > 0
             self.total = (self.total * (1-discount.to_f/100)).to_i
             return "After the discount, the total comes to $#{self.total}."
          else "There is no discount to apply."
          end
      end
  
      def items
          @item
      end
  
      def void_last_transaction
          self.total = self.total - self.last_transaction
          if self.items.length == 0
           self.total = 0
          end
      end
  
  end