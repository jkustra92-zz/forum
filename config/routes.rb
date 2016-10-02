Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root "home#index"

  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments
  end
end

#                   Prefix Verb   URI Pattern                                 Controller#Action
#               home_index GET    /home/index(.:format)                       home#index
#         new_user_session GET    /users/sign_in(.:format)                    devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                    devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                   devise/sessions#destroy
#            user_password POST   /users/password(.:format)                   devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)               devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)              devise/passwords#edit
#                          PATCH  /users/password(.:format)                   devise/passwords#update
#                          PUT    /users/password(.:format)                   devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                     devise/registrations#cancel
#        user_registration POST   /users(.:format)                            devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                    devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                       devise/registrations#edit
#                          PATCH  /users(.:format)                            devise/registrations#update
#                          PUT    /users(.:format)                            devise/registrations#update
#                          DELETE /users(.:format)                            devise/registrations#destroy
#                     root GET    /                                           home#index
#               user_posts GET    /users/:user_id/posts(.:format)             posts#index
#                          POST   /users/:user_id/posts(.:format)             posts#create
#            new_user_post GET    /users/:user_id/posts/new(.:format)         posts#new
#           edit_user_post GET    /users/:user_id/posts/:id/edit(.:format)    posts#edit
#                user_post GET    /users/:user_id/posts/:id(.:format)         posts#show
#                          PATCH  /users/:user_id/posts/:id(.:format)         posts#update
#                          PUT    /users/:user_id/posts/:id(.:format)         posts#update
#                          DELETE /users/:user_id/posts/:id(.:format)         posts#destroy
#                    users GET    /users(.:format)                            users#index
#                          POST   /users(.:format)                            users#create
#                 new_user GET    /users/new(.:format)                        users#new
#                edit_user GET    /users/:id/edit(.:format)                   users#edit
#                     user GET    /users/:id(.:format)                        users#show
#                          PATCH  /users/:id(.:format)                        users#update
#                          PUT    /users/:id(.:format)                        users#update
#                          DELETE /users/:id(.:format)                        users#destroy
#            post_comments GET    /posts/:post_id/comments(.:format)          comments#index
#                          POST   /posts/:post_id/comments(.:format)          comments#create
#         new_post_comment GET    /posts/:post_id/comments/new(.:format)      comments#new
#        edit_post_comment GET    /posts/:post_id/comments/:id/edit(.:format) comments#edit
#             post_comment GET    /posts/:post_id/comments/:id(.:format)      comments#show
#                          PATCH  /posts/:post_id/comments/:id(.:format)      comments#update
#                          PUT    /posts/:post_id/comments/:id(.:format)      comments#update
#                          DELETE /posts/:post_id/comments/:id(.:format)      comments#destroy
#                    posts GET    /posts(.:format)                            posts#index
#                          POST   /posts(.:format)                            posts#create
#                 new_post GET    /posts/new(.:format)                        posts#new
#                edit_post GET    /posts/:id/edit(.:format)                   posts#edit
#                     post GET    /posts/:id(.:format)                        posts#show
#                          PATCH  /posts/:id(.:format)                        posts#update
#                          PUT    /posts/:id(.:format)                        posts#update
#                          DELETE /posts/:id(.:format)                        posts#destroy