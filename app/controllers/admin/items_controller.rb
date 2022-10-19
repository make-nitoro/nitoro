class Admin::ItemsController < ApplicationController
    def index
        @items = Item.all
        @item = Item.new
        @genre = @item.genre
    end    
    
    def new
        @item = Item.new
    end 
    
    def create
        @item = Item.new(item_params)
        @item.save
        redirect_to admin_item_path(@item.id)
    end
    
    def show
        @item = Item.find(params[:id])
        @genre = @item.genre
        #genre_id = Genre.find_by(code: params[:production][:genre_id]).id
        #Production.show(production_params.merge(genre_id: genre_id))
    end
    
    def edit
        @item = Item.find(params[:id])
        @genre = @item.genre
    end
    
    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
        redirect_to admin_item_path(@item.id)
    end
    
    private
    def item_params
        params.require(:item).permit(:image, :name, :introduction, :price, :is_active, :genre_id)
    end
end
