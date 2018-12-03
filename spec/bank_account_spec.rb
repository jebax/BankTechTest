require 'bank_account'

describe BankAccount do
  let(:headers) { 'date || credit || debit || balance' }

  context 'account is empty' do
    it 'shows an empty statement' do
      expect(subject.view_statement).to eq 'date || credit || debit || balance'
    end
  end

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
end
