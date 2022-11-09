# == Route Map
#
#                                   Prefix Verb   URI Pattern                                                                                       Controller#Action
#                              rails_admin        /admin                                                                                            RailsAdmin::Engine
#                                     root GET    /                                                                                                 static_pages#home
#                                   signup GET    /signup(.:format)                                                                                 users#new
#                                          POST   /signup(.:format)                                                                                 users#create
#                                    login GET    /login(.:format)                                                                                  user_sessions#new
#                                          POST   /login(.:format)                                                                                  user_sessions#create
#                                   logout DELETE /logout(.:format)                                                                                 user_sessions#destroy
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
#                        notification_read POST   /notifications/:notification_id/read(.:format)                                                    notifications/reads#create
#                                    about GET    /about(.:format)                                                                                  static_pages#about
#                                  privacy GET    /privacy(.:format)                                                                                static_pages#privacy
#                                    rules GET    /rules(.:format)                                                                                  static_pages#rules
#                            tips_to_enjoy GET    /tips_to_enjoy(.:format)                                                                          static_pages#tips_to_enjoy
#         turbo_recede_historical_location GET    /recede_historical_location(.:format)                                                             turbo/native/navigation#recede
#         turbo_resume_historical_location GET    /resume_historical_location(.:format)                                                             turbo/native/navigation#resume
#        turbo_refresh_historical_location GET    /refresh_historical_location(.:format)                                                            turbo/native/navigation#refresh
#            rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                           action_mailbox/ingresses/postmark/inbound_emails#create
#               rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                              action_mailbox/ingresses/relay/inbound_emails#create
#            rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                           action_mailbox/ingresses/sendgrid/inbound_emails#create
#      rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#health_check
#            rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#create
#             rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                                       action_mailbox/ingresses/mailgun/inbound_emails#create
#           rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#index
#                                          POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#create
#        new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                                      rails/conductor/action_mailbox/inbound_emails#new
#       edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                                 rails/conductor/action_mailbox/inbound_emails#edit
#            rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#show
#                                          PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                          PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                          DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#destroy
# new_rails_conductor_inbound_email_source GET    /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)                              rails/conductor/action_mailbox/inbound_emails/sources#new
#    rails_conductor_inbound_email_sources POST   /rails/conductor/action_mailbox/inbound_emails/sources(.:format)                                  rails/conductor/action_mailbox/inbound_emails/sources#create
#    rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                               rails/conductor/action_mailbox/reroutes#create
# rails_conductor_inbound_email_incinerate POST   /rails/conductor/action_mailbox/:inbound_email_id/incinerate(.:format)                            rails/conductor/action_mailbox/incinerates#create
#                       rails_service_blob GET    /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)                               active_storage/blobs/redirect#show
#                 rails_service_blob_proxy GET    /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)                                  active_storage/blobs/proxy#show
#                                          GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                        active_storage/blobs/redirect#show
#                rails_blob_representation GET    /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations/redirect#show
#          rails_blob_representation_proxy GET    /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)    active_storage/representations/proxy#show
#                                          GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)          active_storage/representations/redirect#show
#                       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                       active_storage/disk#show
#                update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                               active_storage/disk#update
#                     rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                    active_storage/direct_uploads#create
#
# Routes for RailsAdmin::Engine:
#   dashboard GET         /                                      rails_admin/main#dashboard
#       index GET|POST    /:model_name(.:format)                 rails_admin/main#index
#         new GET|POST    /:model_name/new(.:format)             rails_admin/main#new
#      export GET|POST    /:model_name/export(.:format)          rails_admin/main#export
# bulk_delete POST|DELETE /:model_name/bulk_delete(.:format)     rails_admin/main#bulk_delete
# bulk_action POST        /:model_name/bulk_action(.:format)     rails_admin/main#bulk_action
#        show GET         /:model_name/:id(.:format)             rails_admin/main#show
#        edit GET|PUT     /:model_name/:id/edit(.:format)        rails_admin/main#edit
#      delete GET|DELETE  /:model_name/:id/delete(.:format)      rails_admin/main#delete
# show_in_app GET         /:model_name/:id/show_in_app(.:format) rails_admin/main#show_in_app

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  resources :lots, only: %i[new create show]
  namespace :mypage do
    resources :notifications, only: %i[index]
    resources :activities
    resource :account, only: %i[show edit update destroy]
  end

  resources :notifications, only: [] do
    resource :read, only: %i[create], module: :notifications
  end

  get '/about', to: 'static_pages#about'
  get '/privacy', to: 'static_pages#privacy'
  get '/rules', to: 'static_pages#rules'
  get '/tips_to_enjoy', to: 'static_pages#tips_to_enjoy'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
