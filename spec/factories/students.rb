# encoding: utf-8

FactoryGirl.define do
  
  factory :student do
    name Faker::Name.name
    email Faker::Internet.email
    password "12345"
  end
  
end