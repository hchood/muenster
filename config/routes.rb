Muenster::Application.routes.draw do
  resources :jobs, only: [:index, :show]
  resources :companies, only: [:index, :show, :new, :create, :edit, :update]

  root to: 'jobs#index'
end
