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
describe Film, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:reviews).dependent(:delete_all) }
    it { is_expected.to have_one_attached(:photo) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }

    it 'validates description length' do
      expect(subject)
        .to validate_length_of(:description)
        .is_at_least(50)
        .is_at_most(described_class::MAX_DESCRIPTION_LENGTH)
    end
  end
end
