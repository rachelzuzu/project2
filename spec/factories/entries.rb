# The point of a model spec is to test data validations and expected model behaviors.
require 'ffaker'

FactoryGirl.define do
  factory :entry, :class => Entry do
    date 5
    food "whatever"
    mood 4

    # date   { FFaker::Entry.date }
    # food    { FFaker::Entry.food }
    # mood   { FFaker::Entry.mood  }

  end

end
