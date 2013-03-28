WallOfShame::Application.routes.draw do
  resources :parking_violations, :only => [:index]
  root :to => "parking_violations#index"
end
