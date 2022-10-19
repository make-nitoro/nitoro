class Public::OrdersController < ApplicationController
    def new
        @order = Order.new
    end
    
    def create
        @cart_items = current_customer.cart_items.all
        @order = current_customer.orders.new(order_params)
        @order.save
            @cart_items.each do |cart_item|
                @order_dateil = OrderDateil.new
                @order_dateil.item_id = cart_item.item.id
                @order_dateil.order_id = @order.id
                @order_dateil.amount = cart_item.amount
                @order_dateil.price = @order.all_price
                @order_dateil.save
            end
            redirect_to done_path
            @cart_items.destroy_all
    end
    
    def confirm
        @order = Order.new(order_params)
        if params[:order][:address_number] == "1"
            @order.postal_code = current_customer.postal_code
            @order.address = current_customer.address
            @order.name = current_customer.first_name + current_customer.last_name
        elsif params[:order][:address_number] == "2"
            @order.name = Address.find(params[:order][:registered]).name
            @order.address = Address.find(params[:order][:registered]).address
        elsif params[:order][:address_number] == "3"  
            @order = current_customer.orders.new(oeder_params)
        else
            redirect_to new_order_path(@customer)
        end    
        @cart_items = current_customer.cart_items
        @sub_price = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
        @postage = 800
        @all_price = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price + @postage}
    end   
    
    def done
    
    end
    

    
    def index
        @orders = current_customer.orders.all
        @order_dateils = OrderDateil.all
    end
    
    def show
        @order = Order.find(params[:id])
        @orders = Order.all

    end
    
    private
    def order_params
        params.require(:order).permit(:customer_id, :address, :postal_code, :name, :amount, :status, :payment_way, :postage, :all_price)
    end
end
