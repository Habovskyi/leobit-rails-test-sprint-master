# frozen_string_literal: true

def photo_paths
  @photo_paths ||= Dir['public/sample-photos/**']
end

def create_film
  film = Film.create!(
    name:        Faker::Movie.title,
    description: Faker::Lorem.paragraph_by_chars(number: Film::MAX_DESCRIPTION_LENGTH)
  )

  return if rand(0..1).zero?

  film.photo.attach(io: File.open(photo_paths.sample), filename: "#{film.name}.jpg")
end

Rails.logger.info '#=== Populating films ===#'
50.times { create_film }
Rails.logger.info '#=== Populating films finished ===#'
