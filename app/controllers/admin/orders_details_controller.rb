class Admin::OrdersDetailsController < ApplicationController
    def index
        @order_dateil = OrderDateil.all
    end    
    
    
    private
    def order_dateil_params
        params.require(:order_dateil).permit(:item_id, :order_id, :price, :amount, :making_status)
    end
end
