class Public::CustomersController < ApplicationController
    def show
        @customer = current_customer
    end
    
    def confirm
        @customer = current_customer
    end
    
    def edit
        @customer = current_customer
    end    
    
    def update
        @customer = current_customer
        @customer.update(customer_params)
        redirect_to show_path
    end
    
    def withdrawal
        current_customer.update(is_active: false)
        reset_session
        redirect_to top_path
    end
    
    private
    def customer_params
        params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active)
    end
    
end
