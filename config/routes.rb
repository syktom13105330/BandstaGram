Rails.application.routes.draw do

    devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
   }
   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :welcome, :only => [:index]
  root "welcome#index"
  resources :users, :only => [:show, :index]
  
  post "band_photos/:id/create" => "band_photos#create"
  delete "band_photos/:id/destroy" => "band_photos#destroy"
  get "band_photos/:id/edit" => "band_photos#edit"
  get "band_photos/:id/:cnt" => "band_photos#show"
  resources :band_photos
  post "band_details/:user_id/create" => "band_details#create"
  post "band_details/:user_id/destroy" => "band_details#destroy"
  resources :band_details
  resources :belong_bands, :only => [:new, :create]
  get "belong_bands/addmem" => "belong_bands#addmem"
  post "belong_bands/:id/create" => "belong_bands#create"
  post "belong_bands/:id/createmem" => "belong_bands#createmem"
  post "belong_bands/:id/destroy" => "belong_bands#destroy"
 
  get "users/:id/likes" => "users#likes"
  

  post 'friends/:id' => 'friends#create'
  resources :friends
  # post 'friends/new' => 'friends#create'
  # resources :friends, :only => [:index]
  # devise_for :users  
 
# [OLD Post & PostDetail] => Photos
#   get "posts/:id/pdedit" => "posts#pdedit"
#   post "posts/:id/pdupdate" => "posts#pdupdate"
#   resources :posts

  get "photos/image_show/:id/:cnt" => "photos#image_show"
  resources :photos

# [OLD Likes]  => Goods
#   post "likes/:post_id/:post_detail_id/create" => "likes#create"
#   post "likes/:post_id/:post_detail_id/destroy" => "likes#destroy"
  
  post "goods/:id/:cnt/create" => "goods#create"
  delete "goods/:id/:cnt/destroy" => "goods#destroy"

  get "app_messages/:recruitment_id/new" => "app_messages#new"
  delete "app_messages/:id/destroy" => "app_messages#destroy"
  resources :app_messages
  resources :recruitments
  resources :messages, :only => [:create]
  resources :rec_messages, :only => [:create]
  resources :rooms, :only => [:create, :index]
  get "rooms/:id" => "rooms#show"
  resources :rec_rooms, :only => [:create]
  get "rec_rooms/:id" => "rec_rooms#show"
  post "rec_rooms/:recruitment_id" => "rec_rooms#create"
  
  
#   resources :articles


end
