# frozen_string_literal: true

def create_actor
  Actor.create!(
    full_name:        Faker::Name.name,
    description:      Faker::Lorem.paragraph_by_chars(number: 25),
    number_of_oscars: rand(11),
    gender:           Actor.genders.values.sample,
    is_married:       rand(0..1).zero?
  )
end

Rails.logger.info '#=== Populating actors ===#'
50.times { create_actor }
Rails.logger.info '#=== Populating actors finished ===#'
