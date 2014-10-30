Rails.application.routes.draw do
  resources :work_and_classifications

  get 'nierc/:category' => 'classifications#show'

  resources :classifications
end
