Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :companies
  resources :customers
  resources :items
  resources :estimates
  resources :estimate_details
  resources :estimate_pdf, only: [:index, :show]

  get "signup", to: "signup#index"
  resources :signup do
    collection do
      get 'step1'
      post 'step2'  #入力が全て完了
      get 'complete'  #登録完了後
    end
  end
end
