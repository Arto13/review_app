Rails.application.routes.draw do
  root 'docs#index'
  resources :movies, except: [:new, :edit] do
  end
end
