Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  delete '/doctor_patients/:doctor_patient_id', to: 'doctor_patients#delete'
  resources :doctors, only: [:show]
  resources :patients, only: [:index]
end
