require 'transaction'

describe Transaction do
  let(:time) { Time.now }

  before do
    allow(Time).to receive(:now).and_return(time)
  end

  it 'can return its data in an array' do
    transaction = described_class.new(deposit: nil, withdrawal: 1000, balance: 1000)
    expect(transaction.data).to eq [time, nil, 1000, 1000]
  end
end
