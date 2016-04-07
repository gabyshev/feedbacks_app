Rails.application.routes.draw do
  devise_for :users
  root 'feedbacks#index'
end
