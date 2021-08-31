# frozen_string_literal: true

def create_review(film)
  film.reviews.create!(text: Faker::Lorem.paragraph_by_chars(number: Review::MAX_TEXT_LENGTH))
end

Rails.logger.info '#=== Populating reviews ===#'
Film.find_each do |film|
  rand(0..5).times { create_review(film) }
end
Rails.logger.info '#=== Populating reviews finished ===#'
