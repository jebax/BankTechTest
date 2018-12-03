require 'transaction_list'

describe TransactionList do
  it 'has a list of transactions' do
    expect(subject.transactions).to eq []
  end
end
