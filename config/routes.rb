Rails.application.routes.draw do

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  resources :blog_posts do
    resource :cover_image, only: [:destroy], module: :blog_posts
  end

  # :{nom} = variable
  # blog_past_path(1) -> "blog_posts/1"
  # Doit être mis avant sinon new traité comme id
  #get "blog_posts/new", to: "blog_posts#new", as: :new_blog_post
  #get "blog_posts/:id", to: "blog_posts#show", as: :blog_post
  #patch "blog_posts/:id", to: "blog_posts#update"
  #delete "blog_posts/:id", to: "blog_posts#destroy"
  #get "blog_posts/:id/edit", to: "blog_posts#edit", as: :edit_blog_post
  #post "blog_posts", to: "blog_posts#create", as: :blog_posts

  root "blog_posts#index"
end
