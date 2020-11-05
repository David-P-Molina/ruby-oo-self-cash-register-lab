require 'pry'
class CashRegister
    attr_accessor :total, :cart, :discount, :quantity, :added_price
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []

    end

    def add_item(title, price, quantity = 1) #accepts 3 arguments a title, a price which increases the total, optional quantity

         if quantity > 1 #if quantity added is more than 1 item
            i = 0
            until quantity == i
            @cart << title 
            i += 1  
            end
         else #just adds one item
         @cart << title #adds item total to total
         end         
                @added_price= price * quantity
                @total = added_price + @total
    # what is supposed to happen when you add an item. 
    # 1takes the item and adds it to cart(update amount and list in cart)2. updates the price total
    #      doesnt forget about the previous total

    end
    
    def apply_discount #
        if discount > 0
        #take the discount and apply it to the total price (discount times @total price= new price)
            discounted_price = (1-(discount/100.0)) * @total
            @total = discounted_price.floor
            # discount/100.0= discount percentage. discount percentage * @total = discounted price
        return "After the discount, the total comes to $#{total}."
        else
            "There is no discount to apply."    
        end
    end
    
    def items
        return @cart
    end
    
    def void_last_transaction
        @total = @total - @added_price
    end

end