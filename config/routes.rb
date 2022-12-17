# == Route Map
#
#                                   Prefix Verb   URI Pattern                                                                                       Controller#Action
#                                     root GET    /                                                                                                 static_pages#home
#                                   signup GET    /signup(.:format)                                                                                 users#new
#                                          POST   /signup(.:format)                                                                                 users#create
#                                    login GET    /login(.:format)                                                                                  user_sessions#new
#                                          POST   /login(.:format)                                                                                  user_sessions#create
#                                   logout DELETE /logout(.:format)                                                                                 user_sessions#destroy
#                           oauth_callback POST   /oauth/callback(.:format)                                                                         oauths#callback
#                                          GET    /oauth/callback(.:format)                                                                         oauths#callback
#                         auth_at_provider GET    /oauth/:provider(.:format)                                                                        oauths#oauth
#                          password_resets POST   /password_resets(.:format)                                                                        password_resets#create
#                       new_password_reset GET    /password_resets/new(.:format)                                                                    password_resets#new
#                      edit_password_reset GET    /password_resets/:id/edit(.:format)                                                               password_resets#edit
#                           password_reset PATCH  /password_resets/:id(.:format)                                                                    password_resets#update
#                                          PUT    /password_resets/:id(.:format)                                                                    password_resets#update
#                                     lots POST   /lots(.:format)                                                                                   lots#create
#                                  new_lot GET    /lots/new(.:format)                                                                               lots#new
#                                      lot GET    /lots/:id(.:format)                                                                               lots#show
#                     mypage_notifications GET    /mypage/notifications(.:format)                                                                   mypage/notifications#index
#                        mypage_activities GET    /mypage/activities(.:format)                                                                      mypage/activities#index
#                                          POST   /mypage/activities(.:format)                                                                      mypage/activities#create
#                      new_mypage_activity GET    /mypage/activities/new(.:format)                                                                  mypage/activities#new
#                     edit_mypage_activity GET    /mypage/activities/:id/edit(.:format)                                                             mypage/activities#edit
#                          mypage_activity GET    /mypage/activities/:id(.:format)                                                                  mypage/activities#show
#                                          PATCH  /mypage/activities/:id(.:format)                                                                  mypage/activities#update
#                                          PUT    /mypage/activities/:id(.:format)                                                                  mypage/activities#update
#                                          DELETE /mypage/activities/:id(.:format)                                                                  mypage/activities#destroy
#                      edit_mypage_account GET    /mypage/account/edit(.:format)                                                                    mypage/accounts#edit
#                           mypage_account GET    /mypage/account(.:format)                                                                         mypage/accounts#show
#                                          PATCH  /mypage/account(.:format)                                                                         mypage/accounts#update
#                                          PUT    /mypage/account(.:format)                                                                         mypage/accounts#update
#                                          DELETE /mypage/account(.:format)                                                                         mypage/accounts#destroy
#                         admin_activities GET    /admin/activities(.:format)                                                                       admin/activities#index
#                      edit_admin_activity GET    /admin/activities/:id/edit(.:format)                                                              admin/activities#edit
#                           admin_activity GET    /admin/activities/:id(.:format)                                                                   admin/activities#show
#                                          PATCH  /admin/activities/:id(.:format)                                                                   admin/activities#update
#                                          PUT    /admin/activities/:id(.:format)                                                                   admin/activities#update
#                                          DELETE /admin/activities/:id(.:format)                                                                   admin/activities#destroy
#                        notification_read POST   /notifications/:notification_id/read(.:format)                                                    notifications/reads#create
#                                    about GET    /about(.:format)                                                                                  static_pages#about
#                                  privacy GET    /privacy(.:format)                                                                                static_pages#privacy
#                                    rules GET    /rules(.:format)                                                                                  static_pages#rules
#                            tips_to_enjoy GET    /tips_to_enjoy(.:format)                                                                          static_pages#tips_to_enjoy
#                        letter_opener_web        /letter_opener                                                                                    LetterOpenerWeb::Engine
#                              sidekiq_web        /sidekiq                                                                                          Sidekiq::Web


Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'
  post 'oauth/callback' => 'oauths#callback'
  get 'oauth/callback' => 'oauths#callback' # for use with Github, Facebook
  get 'oauth/:provider' => 'oauths#oauth', :as => :auth_at_provider
  resources :password_resets, only: %i[new create edit update]

  resources :lots, only: %i[new create show]
  namespace :mypage do
    resources :notifications, only: %i[index]
    resources :activities
    resource :account, only: %i[show edit update destroy]
  end

  namespace :admin do
    resources :activities, only: %i[index show edit update destroy]
  end

  resources :notifications, only: [] do
    resource :read, only: %i[create], module: :notifications
  end

  get '/about', to: 'static_pages#about'
  get '/privacy', to: 'static_pages#privacy'
  get '/rules', to: 'static_pages#rules'
  get '/tips_to_enjoy', to: 'static_pages#tips_to_enjoy'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'
end
