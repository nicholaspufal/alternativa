# encoding: utf-8

FactoryGirl.define do
  
  factory :group do
    sequence(:name) {|number| "Meu grupo de teste #{number}" }
  end
  
end