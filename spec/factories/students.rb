# encoding: utf-8

FactoryGirl.define do  
  factory :student do
    name Faker::Name.name
    email Faker::Internet.email
    password "12345678910"
    
    after_build do |student|
      student.groups << FactoryGirl.create(:group)
    end
  end
end