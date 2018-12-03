require 'bank_account'

describe BankAccount do
  let(:statement) { double(:statement) }
  subject { BankAccount.new(statement) }

  context 'account with a positive balance' do
    before(:each) do
      subject.deposit(1000)
    end

    it 'shows the correct balance' do
      expect(subject.balance).to eq 1000
    end

    it 'can withdraw to decrease balance' do
      withdrawal = 500
      subject.withdraw(withdrawal)
      expect(subject.balance).to eq 1000 - withdrawal
    end
  end

  describe '#view_statement' do
    it 'calls correct method on its statement' do
      expect(statement).to receive(:display)
      subject.view_statement
    end
  end
end
