require 'bank_account'

describe BankAccount do
  let(:transaction_list) { double(:transaction_list) }
  let(:statement) { double(:statement, display: nil) }
  let(:statement_class) { double(:statement_class, new: statement) }
  subject { BankAccount.new(transaction_list, statement_class) }

  describe '#deposit' do
    it 'calls correct method with deposit data on its transaction list' do
      expect(transaction_list).to receive(:add_transaction).with(deposit: 1000.0, balance: 1000.0)
      subject.deposit(1000)
    end
  end

  describe '#withdraw' do
    it 'calls correct method with withdrawal data on its transaction list' do
      expect(transaction_list).to receive(:add_transaction).with(withdrawal: 1000.0, balance: -1000.0)
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
