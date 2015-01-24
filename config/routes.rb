Rails.application.routes.draw do
  root "episodes#index"
  get 'episodes/index'
  get 'episodes/import'
end
