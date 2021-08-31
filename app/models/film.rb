# frozen_string_literal: true

# == Schema Information
#
# Table name: films
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Film < ApplicationRecord
  MIN_DESCRIPTION_LENGTH = 50
  MAX_DESCRIPTION_LENGTH = 250

  has_many :reviews, dependent: :delete_all
  has_one_attached :photo

  validates :name, :description, presence: true
  validates :description,
            length: { minimum: MIN_DESCRIPTION_LENGTH, maximum: MAX_DESCRIPTION_LENGTH }
end
