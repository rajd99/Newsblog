Rails.application.routes.draw do
  devise_for :users

  #resources :messages do
  #  resources :comments
  #end

  root 'messages#index'


  mount Ckeditor::Engine => '/ckeditor'

  resources :messages do

    member do
      put "like", to: "messages#upvote"
      put "dislike", to: "messages#downvote"
    end
      resources :comments
  end

  resources :categories
end
