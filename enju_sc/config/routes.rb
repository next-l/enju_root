Rails.application.routes.draw do
  resources :themata, id: %r{[^/]+?}, format: /json|csv|xml|html/
  resources :works, only: :index
end
