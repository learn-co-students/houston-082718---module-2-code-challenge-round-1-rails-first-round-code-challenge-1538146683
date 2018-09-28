Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  get 'heroines/filtered', to: 'heroines#filter', as: "filtered_heroines"
  resources :heroines, only: [:index, :show, :new, :create]
end
