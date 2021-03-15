Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :journeys, only: %i[index show] do
    resources :user_journeys, only: %i[create]
  end
  resources :user_journeys, only: %i[index show] do
    member do
      patch :complete
    end
  end
  resources :user_journey_contents, only: %i[show edit update] do
    resources :quiz_questions, only: %i[index]
    resources :user_answers, only: %i[create]
  end

  get "components", to: "pages#components"
end
