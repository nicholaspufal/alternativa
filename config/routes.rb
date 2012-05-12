AlternativaTcc::Application.routes.draw do
  devise_for :students
  
  devise_for :users, :skip => [:registrations]

  
  root :to => "assessments#index"  
  
  resources :exams, :only => [:show] do
    resources :assessments, :only => [:index, :new, :create, :show]
  end
  
  namespace :admin do
    root :to => "exams#index"  
    resources :exams
    resources :groups, :except => [:show]
    resources :students, :except => [:show, :new, :create]
    
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
