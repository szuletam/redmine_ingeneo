# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :indicators, :only => [:index, :new]
resources :indicator_levels, :only => [:index]
resources :indicator_types

