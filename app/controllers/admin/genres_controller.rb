class Admin::GenresController < ApplicationController
    def index
        @genres = Genre.all
        @genre = Genre.new
        #@genre = Genre.new(genre_param)
    end   
    
    def new
        @genre = Genre.new
    end    
    
    def create
        @genre = Genre.new(genre_params)
        #@genres = Genre.all
        if @genre.save
         redirect_to admin_genres_path
        end    
    end
    
    def edit
        @genre = Genre.find(params[:id])
    end
    
    def update
        @genre = Genre.find(params[:id])
        @genre.update(genre_params)
        redirect_to admin_genres_path
        #if @genre.saves
        #else
        #end  
    end
    
    
    private
    
    def genre_params
        params.require(:genre).permit(:name)
    end    
end
