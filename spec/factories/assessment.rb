# encoding: utf-8

FactoryGirl.define do
  sequence(:random_grade) {|n| rand(100)/10.0 }
  
  factory :assessment do
    grade FactoryGirl.generate(:random_grade)
  end
end


