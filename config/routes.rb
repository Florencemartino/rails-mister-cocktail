Rails.application.routes.draw do
  delete 'cocktails/:id', to: 'cocktails#destroy', as: :destroy
  resources :cocktails, only: [:index, :new, :create, :show] do
    resources :doses, only: [:new, :create, :destroy]
  end
end
