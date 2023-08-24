Rails.application.routes.draw do
  # ユーザー用
  devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: "user/sessions"
  }

  root to: "user/homes#top"

  namespace :user do

  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end