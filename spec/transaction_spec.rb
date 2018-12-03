require 'transaction'

describe Transaction do
  let(:time) { Time.now }

  before do
    allow(Time).to receive(:now).and_return(time)
  end

  it 'is instantiated with the correct information' do
    transaction = described_class.new(deposit: 1000, withdrawal: nil, balance: 1000)
    expect(transaction.deposit).to eq 1000
    expect(transaction.withdrawal).to eq nil
    expect(transaction.balance).to eq 1000
    expect(transaction.time).to eq time
  end

  it 'can return its data in an array' do
    transaction = described_class.new(deposit: nil, withdrawal: 1000, balance: 1000)
    expect(transaction.data).to eq [time, nil, 1000, 1000]
  end
end
