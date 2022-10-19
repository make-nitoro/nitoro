class Item < ApplicationRecord
    has_one_attached :image
    belongs_to :genre
    has_many :cart_items, dependent: :destroy
    has_many :order_items, dependent: :destroy
    
    def get_image
        unless image.attached?
            file_path = Rails.root.join('app/assets/images/no.image.jpg')
            image.attach(io: File.open(file_path), filename: 'no.image.jpg', content_type: 'image/jpeg')
        end
        image
    end    
    
    def with_tax_price
        (price * 1.1).floor
    end
end
