require 'transaction_list'

describe TransactionList do
  let(:transaction_class) { double(:transaction_class) }
  subject { TransactionList.new(transaction_class) }

  it 'can return a list of transactions' do
    expect(subject.transactions).to eq []
  end

  it 'can create a new transaction object' do
    expect(transaction_class).to receive(:new).with(deposit: 1000, withdrawal: nil, balance: 1000)
    subject.add_transaction(deposit: 1000, withdrawal: nil, balance: 1000)
  end
end
