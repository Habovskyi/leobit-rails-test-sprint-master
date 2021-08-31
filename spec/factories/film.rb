# frozen_string_literal: true

FactoryBot.define do
  factory :film do
    name        { Faker::Movie.title }
    description { Faker::Lorem.paragraph_by_chars(number: Film::MAX_DESCRIPTION_LENGTH) }

    trait :with_reviews do
      after(:create) do |film|
        film.reviews << create_list(:review, rand(1..4))
      end
    end
  end
end
