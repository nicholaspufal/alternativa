# encoding: utf-8

FactoryGirl.define do
  factory :assessment do
    grade { generate(:random_grade) }
  end
end

FactoryGirl.define do
  sequence :random_grade do |n|
    rand(100)/10.0
  end
end
