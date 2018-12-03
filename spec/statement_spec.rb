require 'statement'

describe Statement do
  let(:headers) { 'date || credit || debit || balance' }
  let(:transaction_list) { double(:transaction_list, transactions: []) }
  let(:time) { Time.now }
  let(:formatted_time) { time.strftime('%d/%m/%Y') }
  subject { Statement.new(transaction_list) }

  before do
    allow(Time).to receive(:now).and_return time
  end

  it 'only shows statement headers when no transactions are completed' do
    expect(subject.display).to eq headers + "\n"
  end

  it 'displays a correctly formatted statement for one deposit' do
    deposit = double(:transaction, data: [time, 1000.0, nil, 1000.0])
    deposit_line = "#{formatted_time} || 1000.00 || || " \
    "1000.00"

    transaction_list.transactions << deposit
    statement = described_class.new(transaction_list)

    expect(statement.display).to eq "#{headers}\n#{deposit_line}"
  end
end
