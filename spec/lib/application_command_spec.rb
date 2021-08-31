# frozen_string_literal: true

describe ApplicationCommand do
  describe '.call' do
    let(:mock) { double }

    before { allow(described_class).to receive(:new).and_return(mock) }

    it 'creates an object and perform #call method' do
      expect(mock).to receive(:call)
      described_class.call
    end
  end
end
