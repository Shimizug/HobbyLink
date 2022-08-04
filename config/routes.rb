Rails.application.routes.draw do
  namespace :admin do
    get 'boards/index'
    get 'boards/new'
    get 'boards/show'
  end
  namespace :admin do
    get 'members/index'
    get 'members/show'
    get 'members/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'posts/index'
    get 'posts/show'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  namespace :public do
    get 'boards/index'
    get 'boards/show'
    get 'boards/edit'
    get 'boards/new'
  end
  namespace :public do
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
    get 'posts/new'
  end
  namespace :public do
    get 'members/index'
    get 'members/show'
    get 'members/edit'
    get 'members/unsubscribe'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
# 会員用
devise_for :members,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
end
