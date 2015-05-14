# The point of a model spec is to test data validations and expected model behaviors.
require 'ffaker'

FactoryGirl.define do
  factory :entry, :class => Entry do
    date 05/12/15
    food "whatever"
    mood 4

  end

end

