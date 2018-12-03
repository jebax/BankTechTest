require 'bank_account'

describe BankAccount do
  it 'prints an empty statement when no transactions are made' do
    expect(subject.view_statement).to eq 'date || credit || debit || balance'
  end
end
