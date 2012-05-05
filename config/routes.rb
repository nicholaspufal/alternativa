AlternativaTcc::Application.routes.draw do
  devise_for :users

  root :to => "assessments#index"  
  
  resources :exams, :only => [:show] do
    resources :assessments, :only => [:index, :new, :create, :show]
  end
  
  namespace :admin do
    root :to => "exams#index"  
    resources :exams
    resources :groups
    resources :students
    
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
