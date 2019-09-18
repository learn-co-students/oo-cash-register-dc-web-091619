require "pry"

class CashRegister
    attr_accessor :total, :last_transaction
    
    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items=[]
    end

    def discount
        @discount
    end

    def add_item(item, price, num=1)
        self.total += price*num
        num.times {self.items << item}
        self.last_transaction=[item, price, num]
    end

    def apply_discount
        if discount == nil
            return "There is no discount to apply."
        else 
            self.total-=self.total*self.discount/100
            "After the discount, the total comes to $800."
        end
    end
    
    def items
        @items
    end

    def void_last_transaction
        last_item= self.last_transaction[0]
        last_price= self.last_transaction[1]
        last_num=self.last_transaction[2]
        self.total-=last_num*last_price
        # self.items=self.items.splice(-1,last_num)
        #self.items= last_num.times{self.items.pop()}
        #binding.pry
        #self.items = last_num.times{self.items.pop}
        # if self.items.length == 0
    end
end