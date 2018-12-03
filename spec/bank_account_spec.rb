require 'bank_account'

describe BankAccount do
  let(:statement) { double(:statement) }
  subject { BankAccount.new(statement) }

  describe '#deposit' do
    it 'calls correct method with deposit data on its statement' do
      expect(statement).to receive(:add_transaction).with(deposit: 1000.0, withdrawal: nil, balance: 1000.0)
      subject.deposit(1000)
    end
  end

  describe '#withdraw' do
    it 'calls correct method with withdrawal data on its statement' do
      expect(statement).to receive(:add_transaction).with(deposit: nil, withdrawal: 1000.0, balance: -1000.0)
      subject.withdraw(1000)
    end
  end

  describe '#view_statement' do
    it 'calls correct method on its statement' do
      expect(statement).to receive(:display)
      subject.view_statement
    end
  end
end
