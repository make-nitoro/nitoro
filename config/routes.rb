Rails.application.routes.draw do
 
 # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
 
 scope module: :public do
    root to: 'homes#top'
    get 'home/about' => 'home#about', as: 'about'
    get 'items/top' => 'items#top', as: 'top'
    resources :items, only: [:index, :show]
   
    get 'custmers/show' => 'customers#show', as: 'show' 
    get 'custmers/edit' => 'customers#edit', as: 'edit'
    get 'custmers/confirm' => 'customers#confirm', as: 'confirm'
    patch 'customers/update' => 'customers#update', as: 'update'
    patch 'customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    
     
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    
    post 'orders/confirm' => 'orders#confirm', as: 'orders_confirm'
    get 'orders/done' => 'orders#done', as: 'done'
    resources :orders, only: [:new, :create, :index, :show]
    
    
    
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
 end 
  # 管理者用
  # URL /admin
 
   namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:new, :index, :create, :show, :edit, :update]
    resources :genres, only: [:new, :index, :create, :edit, :update]
    resources :customers, only: [:new, :index, :show, :edit, :update]
    resources :orders, only: [:new, :index, :show, :update]
    resources :orders_details, only: [:new, :update]
  end  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
