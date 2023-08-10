Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists, only: %i(index show new create) do
    resources :bookmarks, only: [:new, :create]
  end #[:index, :show, :new, :create]

  delete '/bookmarks/:id', to: 'bookmarks#destroy', as: 'bookmark'
  get '/bookmarks/:id', to: 'bookmarks#destroy'
end
