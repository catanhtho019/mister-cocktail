Rails.application.routes.draw do
  root to: "pages#home"
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:create, :new, :show]
    resources :reviews, only: [:create]
  end
  resources :doses, only: [:destroy]
end
