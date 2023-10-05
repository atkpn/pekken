Rails.application.routes.draw do

  # ユーザー用
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: 'users/passwords'
  }

  root to: "users/homes#top"
  devise_scope :user do
    post 'users/guest_sign_in' => 'users/sessions#guest_sign_in'
  end

  scope module: :users do
    get '/my_page' => 'users#show', as: :my_page
    get '/infomation/edit' => 'users#edit', as: :user_edit
    patch '/infomation' => 'users#update', as: :user_update
    get '/unsubscribe' => 'users#unsubscribe', as: :user_unsubscribe
    patch '/withdraw' => 'users#withdraw', as: :user_withdraw
    resources :pets, except:[:index] do
      resources :body_infos, only: [:new, :create, :edit, :update, :destroy]
      resources :meals
      resources :cares, only:[:new, :create, :index, :destroy] do
        resources :pet_cares, only:[:new, :create, :edit, :update, :destroy]
      end
    end
    resources :feeds, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :care_items, only: [:create, :edit, :update, :destroy]
  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :admin do
    get 'admin' => 'homes#top'
  end

  namespace :admin do
    resources :users, only:[:show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
