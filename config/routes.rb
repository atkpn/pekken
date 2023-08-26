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

  namespace :users do

  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
