Rails.application.routes.draw do
  resources :themata, id: %r{[^/]+?}, format: /json|csv|xml|html/
end
