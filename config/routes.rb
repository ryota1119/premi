Rails.application.routes.draw do
  get 'items/index'
  get 'items/new'
  get 'items/edit'
  get 'items/update'
  get 'items/destroy'
  devise_for :users
  root to: "home#index"
  resources :users
  resources :companies
  resources :customers

  get "signup", to: "signup#index"
  resources :signup do
    collection do
      get 'step1'
      post 'step2'  #入力が全て完了
      get 'complete'  #登録完了後
    end
  end
end
