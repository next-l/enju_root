Rails.application.routes.draw do
  resources :nomen_relationships

  resources :themata, id: %r{[^/]+?}, format: /json|csv|xml|html/
  resources :works, only: :index
  resources :nomina
end
