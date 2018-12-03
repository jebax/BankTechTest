require 'bank_account'

describe BankAccount do
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
    let(:headers) { 'date || credit || debit || balance' }
    let(:time) { Time.now }
    let(:format_time) { time.strftime('%d/%m/%Y') }

    before do
      allow(Time).to receive(:now).and_return(time)
    end

    it 'shows an empty statement when no transactions are made' do
      expect(subject.view_statement).to eq headers + "\n"
    end

    it 'shows a deposit transaction on a statement with the correct time' do
      amount = 1000
      statement =
        "#{headers}\n#{format_time} || || #{amount}.00 || #{amount}.00"

      subject.deposit(amount)
      expect(subject.view_statement).to eq statement
    end

    it 'shows a withdraw transaction on a statement with the correct time' do
      deposit = 1000
      withdrawal = 500
      deposit_line = "#{format_time} || || #{deposit}.00 || #{deposit}.00"
      withdraw_line = "#{format_time} || #{withdrawal}.00 || || 500.00"

      subject.deposit(deposit)
      subject.withdraw(withdrawal)

      result = "#{headers}\n#{deposit_line}\n#{withdraw_line}"
      expect(subject.view_statement).to eq result
    end
  end
end
