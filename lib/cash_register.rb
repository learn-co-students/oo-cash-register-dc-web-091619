require "pry"

class CashRegister
    #gets the discount, and total
    attr_accessor :discount, :total, :items


    def initialize(discount = 0) #sets total to 0, and optionally can take the discount
        @total = 0
        @discount = discount
        @items = []
        @last_item_added = ""
    end

    def add_item(title, price, quantity = 0)
        if quantity == 0                #if 0 then it will just add the price to the total
            @total = @total + price
            @last_transaction_amount = price #keeps track of the last price added to the total
            @items << title
            @last_item_added  = title      #keeps track of the last item
        else                            #if quantity is not 0 then we'll multiply the price with the qty and then add
            @total = @total + price*quantity
            @last_transaction_amount = price
            i = 0       #this will be the counter
            
            quantity.times do #this will continue to add to the item array depending on the quantity
                @items << title 
            end
            @last_item_added  = title
        end
    end

    def apply_discount  #inital discount will be 20%
        if @discount > 0 
            @discount = @discount/100.to_f   #will divide the discount by 100 and the ._f will return the float (decimal) number 
            discount_amt = @total * @discount #this will be how much is deducted
            @total = @total - discount_amt      #this deducts the discount amount from total
            "After the discount, the total comes to $#{@total.to_i}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @items.delete(@last_item_added) #delets the last item deleted
        if @items.length == 0       #if the length is 0 after we delete last item from array then we set total to 0
            @total = 0.00
        else 
            @total = @total - @last_transaction_amount
        end
    end
end
