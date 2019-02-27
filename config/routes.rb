Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "tasks", to: "tasks#index"
  # verb + path + to + controller/action(method)
  get "tasks/new", to: "tasks#new", as: :new_task
  # Step 1, GET the form : The first one to GET the empty HTML form
  get "tasks/:id", to: "tasks#show", as: :task
  post "tasks", to: "tasks#create"
  # Step 2, POST the form -> differs from get "tasks" : The second one to POST this form
  get "tasks/:id/edit", to: "tasks#edit", as: :update_task
  # The first one to GET the pre-populated HTML form of existing record
  patch "tasks/:id", to: "tasks#update"
  # The second one to PATCH this form
  delete "tasks/:id", to: "task#destroy"
end
