require 'bank_account'

describe BankAccount do
  let(:headers) { 'date || credit || debit || balance' }

  context 'account is empty' do
    it 'shows an empty statement' do
      expect(subject.view_statement).to eq 'date || credit || debit || balance'
    end
  end

  context 'one deposit made to account' do
    it 'updates the balance correctly' do
      amount = 1000
      subject.deposit(amount)
      expect(subject.balance).to eq amount
    end
  end
end
