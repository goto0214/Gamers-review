Rails.application.routes.draw do

   # 利用者用ルーティング
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: "user/sessions"
  }

  root to: "user/homes#top"
  get "about" => "user/homes#about", as: "about"



   # 管理者用ルーティング
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
  end

end
