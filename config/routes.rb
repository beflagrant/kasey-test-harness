Rails.application.routes.draw do
  resources :intakes
  resources :outtakes
  devise_for :users
  mount Kasey::Engine => "/kasey", as: 'kasey'

  resources :intakes, only: [:show]
end
