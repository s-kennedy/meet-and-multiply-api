Rails.application.routes.draw do
  root to: 'applicants#index'
  resources :applicants
  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  post '/applicants/:id/update_status', to: 'applicants#update_status'
end
