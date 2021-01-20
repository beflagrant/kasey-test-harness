Rails.application.routes.draw do
  devise_for :users
  mount Kasey::Engine => "/kasey", as: 'kasey'

  resources :intakes, only: [:show]
end
