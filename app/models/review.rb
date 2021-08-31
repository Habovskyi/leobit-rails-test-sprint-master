# frozen_string_literal: true

# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  film_id    :bigint
#
# Indexes
#
#  index_reviews_on_film_id  (film_id)
#
# Foreign Keys
#
#  fk_rails_...  (film_id => films.id) ON DELETE => cascade
#
class Review < ApplicationRecord
  MIN_TEXT_LENGTH = 10
  MAX_TEXT_LENGTH = 100

  belongs_to :film

  validates :text, presence: true
  validates :text, length: { minimum: MIN_TEXT_LENGTH, maximum: MAX_TEXT_LENGTH }
end
