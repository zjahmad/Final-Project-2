Rails.application.routes.draw do
  resources :users
  resources :students
  resources :registrations
  resources :families
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :camps
  resources :camp_instructors
  resources :curriculums
  resources :instructors
  resources :locations
  
  get 'home', :to => 'home#home'
  get 'about', :to => 'home#about'
  get 'contact', :to => 'home#contact'
  get 'privacy', :to => 'home#privacy'
  
  root to: 'home#home'

end
