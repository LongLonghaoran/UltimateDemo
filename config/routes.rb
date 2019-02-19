Rails.application.routes.draw do
  resources :articles
  devise_for :users

  resources :attachments do
    member do
      get :download
    end
    collection do
      post :upload
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
