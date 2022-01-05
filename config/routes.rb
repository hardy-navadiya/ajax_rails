Rails.application.routes.draw do
  get 'students/new'
  get 'mains/home'
  get 'students/btn_green'
  get 'students/btn_green_input'

  root 'mains#home'

  delete 'destroy' => 'students#destroy'

  resources 'students'
end
