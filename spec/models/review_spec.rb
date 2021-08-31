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
describe Review, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:film) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:text) }

    it 'validates text length' do
      expect(subject)
        .to validate_length_of(:text)
        .is_at_least(described_class::MIN_TEXT_LENGTH)
        .is_at_most(described_class::MAX_TEXT_LENGTH)
    end
  end
end
