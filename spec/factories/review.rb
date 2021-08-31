# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    text { Faker::Lorem.paragraph_by_chars(number: Review::MAX_TEXT_LENGTH) }

    film
  end
end
