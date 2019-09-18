require "pry"

class CashRegister
    attr_accessor :total, :discount, :cart, :quant

    def initialize(employee_discount=0) 
        @total = 0
        @discount = employee_discount
        @cart = []
    end

    def add_item(product,price,quant=1)
        @item_charge = price * quant
        self.total += @item_charge
        quant.times do
        self.cart.push(product)
        end
    end

    def apply_discount
        unless @discount == 0
        @total = @total - (@total * (@discount*0.01))
        return "After the discount, the total comes to $#{self.total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @cart
    end

    def void_last_transaction
        self.total -= @item_charge
    end

end

