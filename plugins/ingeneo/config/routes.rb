# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :indicators, :only => [:index, :new, :create, :update, :show] do
  collection do
    post 'form'
  end
end
resources :indicator_levels, :only => [:index]
resources :indicator_types

