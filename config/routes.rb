Rails.application.routes.draw do
  resources :users
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  resources :article_categories do
    resources :articles
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
