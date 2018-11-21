Rails.application.routes.draw do
  get 'reviews/create'
  root to: "cocktails#index"

  get 'cocktails', to: "cocktails#index"

  get 'cocktails/new', to: "cocktails#new", as: :new_cocktail
  post 'cocktails', to: "cocktails#create"

  resources :cocktails, only: [:show] do
    # resources :doses, only: [:new, :create]
    resources :doses, only: [:create]

    resources :reviews, only: [:create]
  end

  delete 'doses/:id', to: "doses#destroy", as: :destroy_dose

end
