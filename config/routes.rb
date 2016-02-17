Rails.application.routes.draw do
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  root 'sessions#new'
  get "quiz"  => "quizzes#quiz"

  resources :courses
  resources :quizzes do
    resources :responses
  end
  resources :questions
  resources :users
  resources :user_courses
  resources :instructors, :controller => 'users'
  resources :students, :controller => 'users'
end
