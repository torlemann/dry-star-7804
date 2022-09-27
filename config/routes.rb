Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors, only: [:show, :destroy]
  post "doctors/:id", to: "doctors#create"
  resources :patients, only: [:index]
  
end
