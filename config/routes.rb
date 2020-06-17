Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'
  resources :bookmarks
  resources :books do
      resources :comments
    end
  #get 'welcome/index'
  match ':controller(/:action(/:id))', :via => :get


  root 'books#index'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
