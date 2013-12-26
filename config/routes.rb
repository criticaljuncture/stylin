Stylin::Engine.routes.draw do
  resources :styleguides, only: [:index, :show]

  root to: "styleguides#index"
end
