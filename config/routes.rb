Rails.application.routes.draw do

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    resources :members, only: [:index, :show, :edit, :update, :destroy] do
      get 'admin/favorites' => 'favorites#index', as: 'favorites'
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :posts, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:create,:destroy]
    end
    resources :genres, only: [:index, :create, :edit, :update]
    resources :boards, only: [:index, :show, :destroy] do
      resources :board_comments, only: [:create, :destroy]
    end
  end

  # 会員用
  devise_for :members,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #ゲストログイン用
  devise_scope :member do
    post 'guest_sign_in' => 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about', as: 'about'

    get 'members/information/:id/edit' => 'members#edit', as: 'edit_information'
    patch 'members/information/:id' => 'members#update', as: 'update_information'
    get 'members/unsubscribe/:id' => 'members#unsubscribe', as: 'confirm_unsubscribe'
    put 'members/information/:id' => 'members#update'
    patch 'members/withdraw/:id' => 'members#withdraw', as: 'withdraw'

    resources :members, only: [:index, :show] do
      resource :relationships, only: [:create, :destroy]
      get 'member/favorites' => 'favorites#index', as: 'favorites'
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    resources :posts do
      resources :post_comments, only: [:create, :update, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

    resources :boards, except: [:edit, :update, :destroy] do
      resources :board_comments, only: [:create, :destroy]
    end
  end

  get 'search' => 'searches#search', as: 'search'
  get 'rank' => 'ranks#rank', as: 'rank'
end
