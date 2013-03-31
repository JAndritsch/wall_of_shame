WallOfShame::Application.routes.draw do
  resources :parking_violations, :only => [:index, :new, :create]
  resources :cars, :only => [:edit, :update]
  root :to => "parking_violations#index"
end
