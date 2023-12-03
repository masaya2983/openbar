Rails.application.routes.draw do
  devise_for :admins,skip: [:registrations, :passwords], path: :admin, controllers:{
   sessions: "admin/sessions"
  }

  devise_for :users , skip: [:passwords], controllers:{
   registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :users do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end

  namespace :admin do
   root :to => "homes#top"
   resources :users, only: [:index, :show, :update, :destroy]
   resources :liquors, only: [:index, :show, :update, :destroy, :new ]
   #resources :category, only: [:index, :show, :edit, :update]
 end
 #ゲスト用
 devise_scope :users do
    post 'user/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end
 scope module: :public do
  #post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
   root :to => "homes#top"
   get "home/about"=>"homes#about"
  resources :users, only: [:index,:show,:edit,:update] do
   get "check" => "customers#check"
    patch "withdrawal" => "customers#withdrawal"
     resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :messages, only: [:create]
resources :rooms, only: [:create,:show]

  get "search" => "searches#search"
  resources :liquors, only: [:index,:create,:show,:update,:destroy,:edit,:new] do
  resource :favorites, only:[:create,:destroy]

  end

  resources :liquorcomments, only: [:create,:destroy]

  resources :groups, only:  [:new, :index, :show, :create, :edit, :update] do
  resource :group_users, only: [:create, :destroy]
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end

  get "category" => "categories#search"
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
