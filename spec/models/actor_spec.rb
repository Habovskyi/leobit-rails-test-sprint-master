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

# TODO: add more unit tests for model
describe Actor, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:full_name) }
  end
end
