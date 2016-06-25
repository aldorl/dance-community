Rails.application.routes.draw do
    devise_for :members, :controllers => { :registrations => "registrations" }

    resources :after_signup

    root "pages#show", page: "home"
    get "/pages/*page" => "pages#show"
end
