Rails.application.routes.draw do
    devise_for :members

    root "pages#show", page: "home"
    get "/pages/*page" => "pages#show"
end
