# frozen_string_literal: true

FactoryBot.define do
  factory :actor do
    full_name        { Faker::Name.name }
    description      { Faker::Lorem.paragraph_by_chars(number: 25) }
    gender           { Actor.genders.values.sample }
    number_of_oscars { rand(11) }
  end
end
