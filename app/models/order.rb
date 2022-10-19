class Order < ApplicationRecord
    enum payment_way: { credit_card: 0, transfer: 1 }
    has_many :order_dateils, dependent: :destroy
    belongs_to :customer
    has_many :items, through: :order_dateils
    
    def with_tax_price
        (price * 1.1).floor
    end
end
