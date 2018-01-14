Rails.application.routes.draw do
  resources :currencyprices
  resources :currencyinfos, except: :show
  get "/currencyinfos/:symbol", to: "currencyinfos#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
