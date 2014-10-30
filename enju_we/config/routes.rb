Rails.application.routes.draw do
  resources :manifestation_relationship_types


  resources :languages


  resources :expression_relationship_types


  resources :expression_relationships


  resources :work_relationship_types


  resources :work_relationships


  resources :creates


  resources :realizes


  resources :produces


  resources :content_types


  resources :carrier_types


  resources :reifies


  resources :embodies


  resources :works


  resources :expressions


  resources :manifestations


  resources :subjects


  resources :agents


  get '/bib_id/:bib_id' => 'manifestations#show'
end
