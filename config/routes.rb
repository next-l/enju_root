EnjuRoot::Engine.routes.draw do
  resources :embody_types
  resources :manifestations
  resources :embodies
  resources :work_relationship_types
  resources :content_types
  resources :languages
  resources :work_relationships
  resources :work_and_subjects
  resources :nomens
  resources :themas
  resources :expressions
  resources :works
  root to: "works#index"
end
