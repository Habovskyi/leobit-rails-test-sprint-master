# frozen_string_literal: true

# == Schema Information
#
# Table name: actors
#
#  id               :bigint           not null, primary key
#  description      :text
#  full_name        :string
#  gender           :string
#  is_married       :boolean          default(FALSE)
#  number_of_oscars :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Actor < ApplicationRecord
  validates :full_name, presence: true

  # TODO: add more validations

  enum gender: {
    male:   MALE   = 'male',
    female: FEMALE = 'female',
    other:  OTHER  = 'other'
  }
end
