Rails.application.routes.draw do
  namespace :api, path: '/', constraints: { subdomain: 'api' } do
    resources :meals do
      resources :insulins
      resources :ingredients
    end
    resources :blood_sugars # Don't scope to a meal; association is done using Timestamps
    resources :insulins # Insulins can be taken independently of a meal
  end  
end
