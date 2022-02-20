Rails.application.routes.draw do
  namespace 'api' do
    resources :uploaders, param: :slug
  end
end
