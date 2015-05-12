# The point of a model spec is to test data validations and expected model behaviors.
require 'ffaker'

FactoryGirl.define do
  factory :user , :class => User do
    password "foobar123"
    password_confirmation { |u| u.password }
    email { FFaker::Internet.email }

  end

end
