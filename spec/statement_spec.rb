require 'statement'

describe Statement do
  let(:headers) { 'date || credit || debit || balance' }

  describe '#display' do
    it 'only shows statement headers when no transactions are completed' do
      expect(subject.display).to eq headers
    end
  end
end
