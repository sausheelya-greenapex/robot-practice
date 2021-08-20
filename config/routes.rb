Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
     get "robots/:id/order", to: "actions#order" , as:"command"
  end

end
