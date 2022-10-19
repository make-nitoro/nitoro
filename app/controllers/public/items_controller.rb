class Public::ItemsController < ApplicationController
    def top
        @items = Item.order('id DESC').limit(4)
   
        
    end    
    def index
        @genres = Genre.all
        if params[:genre_id]
            @genre = Genre.find(params[:genre_id])
            all_items = @genre.items
        else
            all_items = Item.all
        end
        @items = all_items.page(params[:page])
        #@genre = @item.genre
       
    end
    
    def show
        @item = Item.find(params[:id])
        #@genre = @item.genre
    end
    
    private
    def item_params
        params.require(:item).permit(:image, :name, :introduction, :price, :is_active, :genre_id)
    end
end
