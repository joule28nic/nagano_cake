Rails.application.routes.draw do

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :genres, only: [:create, :index, :edit, :update]
    resources :items, except: [:destroy]
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
    get 'customers/my_page' => 'public/customers#show'
    get 'customers/information/edit' => 'public/customers#edit'
    get '/customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/withdraw' => 'public/customers#withdrawal', as: 'withdrawal'
  end

end
