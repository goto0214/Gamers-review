Rails.application.routes.draw do
  # 利用者用ルーティング
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: "user/sessions",
  }

  root to: "user/homes#top"
  get "about" => "user/homes#about", as: "about"

  get 'users' => 'user/users#dummy'

  devise_scope :user do
    post 'user/guest_sign_in', to: 'user/guests#guest_sign_in'
  end

  scope module: :user do
    resources :reviews do
      resources :comments, only: [:create, :destroy]
      resources :reports, only: [:create, :destroy]
    end
    get "ranking" => "reviews#ranking", as: "reviews_ranking"
    resources :users, only: [:edit, :update, :show]
  end

  # 管理者用ルーティング
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions",
  }

  namespace :admin do
    root to: "homes#top"
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    get "reports" => "reports#index", as: "reports_index"
    resources :users, only: [:index, :show, :destroy]
  end
end
