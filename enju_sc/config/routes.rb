Rails.application.routes.draw do
  resources :work_and_themata

  get 'nierc/:category' => 'themata#show'

  resources :themata
end
