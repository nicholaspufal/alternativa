# encoding: utf-8

FactoryGirl.define do  
  factory :teacher do
    name Faker::Name.name
    email Faker::Internet.email
    password "12345678910"
    admin true
  end
end