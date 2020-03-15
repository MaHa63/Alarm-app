Rails.application.routes.draw do
  resources :customers
  resources :todos
  devise_for :users, :controllers => { :registrations => "registrations" }
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'todos#index'


  devise_scope :user do
  	get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
  	get 'signup', to: 'devise/registrations#new'
  end

  resources :todos do
    collection do 
      get 'todos/new_task' => 'todos#new_task', :as => :new_task
      post 'todos/edit_task' => 'todos#edit_task', :as => :edit_task
    end
  end
  
   resources :customers do
    collection do 
      get 'customers/new_entry' => 'customers#new_entry', :as => :new_entry
      post 'customers/edit_entry' => 'customers#edit_entry', :as => :edit_entry
    end
  end
  
  post 'close', to:'todos#close'
  post 'open', to:'todos#open'
  get 'history', to:'todos#history'

end
