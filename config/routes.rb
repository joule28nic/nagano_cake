Rails.application.routes.draw do

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only: [:create, :index, :edit, :update]
    resources :items, except: [:destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end


  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'home/about' => 'homes#about', as: :about
    get 'customers/my_page' => 'customers#show', as: 'my_page'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    post 'orders/comfirm' => 'orders#comfirm', as: 'comfirm'
    get 'orders/complete' => 'orders#complete', as: 'complete'
    resources :items, only: [:index, :show]
    resources :addresses, except: [:new, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
  end

end
