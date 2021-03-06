AlternativaTcc::Application.routes.draw do
  #devise
  devise_for :students, :controllers => { :registrations => "registrations" }
  
  devise_for :users, :controllers => { :registrations => "registrations" }, :skip => [:registrations]

  #/
  root :to => "assessments#index"  
  
  resources :exams, :only => [:show] do
    resources :assessments, :only => [:index, :new, :create, :show]
  end
  
  scope "/results" do
    root :to => "results#index", :as => "results"
    #match "/:id" => "results#show", :constraints => { :id => /\d+/ }, :as => "student_report"
  end
  
  #/admin
  namespace :admin do
    root :to => "exams#index"  
    resources :exams
    resources :groups, :except => [:show]
    resources :students, :except => [:show, :new, :create] do
      put :toggle_status, :as => "toggle_status"
    end
    
    scope "/groups_reports" do
      root :to => "groups_reports#index", :as => "groups_reports"
      match "/:id" => "groups_reports#show", :constraints => { :id => /\d+/ }, :as => "group_report"
    end
    
    scope "/students_reports" do
      root :to => "students_reports#index", :as => "students_reports"
      match "/:id" => "students_reports#show", :constraints => { :id => /\d+/ }, :as => "student_report"
    end
  end
end
