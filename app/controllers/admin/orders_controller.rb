class Admin::OrdersController < ApplicationController
    def index
        @orders = Order.all
        @items = Item.all
    end    
    
    def show
        @order = Order.find(params[:id])
        @orders = Order.all
        @customer = @order.customer
    end
    
    
    
     private
    def order_params
        params.require(:order).permit(:customer_id, :address, :postal_code, :name, :amount, :status, :payment, :postage, :all_price)
    end
end
