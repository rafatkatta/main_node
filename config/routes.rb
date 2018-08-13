Rails.application.routes.draw do
  resources :orders
  resources :clients
  resources :coins do
    collection do
      post 'check'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
