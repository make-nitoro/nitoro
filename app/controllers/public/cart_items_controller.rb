class Public::CartItemsController < ApplicationController
    def index
        @cart_items = current_customer.cart_items.all
        @all_price = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    end
    
    def create
        @cart_item = current_customer.cart_items.new(cart_item_params)
        @cart_item_already = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
        if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
            @new_amount = @cart_item.amount + @cart_item_already.amount
            #@cart_item_already.amount += @cart_item.amount
            @cart_item_already.update(amount: @new_amount)
            redirect_to cart_items_path
        else
            @cart_item.save
            redirect_to cart_items_path
        end
        
        
    end
    
    def update
        #@cart_item = current_customer
        @cart_item = CartItem.find(params[:id])
        @cart_item.update(cart_item_params)
        redirect_to cart_items_path
    end
    
    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        redirect_to cart_items_path
    end
    
    def destroy_all
        @cart_items = current_customer.cart_items.all
        @cart_items.destroy_all
        redirect_to cart_items_path
    end
    
    private
    def cart_item_params
        params.require(:cart_item).permit(:customer_id, :item_id, :amount)
    end
end
