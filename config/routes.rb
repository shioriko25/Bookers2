Rails.application.routes.draw do
  devise_for :users
  
  get 'home/about' => 'homes#about'
  root to: 'homes#top'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


   resources :users, only: [:show, :edit, :index, :update, :create]
   resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
   resource :favorites, only: [:create, :destroy]
   

end
