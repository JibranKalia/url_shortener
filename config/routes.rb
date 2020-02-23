Rails.application.routes.draw do
  root 'short_urls#new'
  get '/:id', to: 'short_urls#redirect'

  resources :short_urls do
    get :redirect
  end
end
