require 'bank_account'
require 'statement'
require 'transaction_list'
require 'transaction'

feature 'using a bank account' do
  let(:account) { BankAccount.new }
  let(:time) { Time.now }
  let(:formatted_time) { time.strftime('%d/%m/%Y') }

  before do
    allow(Time).to receive(:now).and_return(time)
  end

  scenario 'adds 1000, adds 2000, withdraws 500, then views statement' do
    statement = "date || credit || debit || balance\n#{formatted_time} || " \
    "1000.00 || || 1000.00\n#{formatted_time} || 2000.00 || || 3000.00\n" \
    "#{formatted_time} || || 500.00 || 2500.00\n"

    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)

    expect { account.view_statement }.to output(statement).to_stdout
  end

  scenario 'withdraws 45, adds 1.23, adds 123.65, then views statement' do
    statement = "date || credit || debit || balance\n#{formatted_time} || " \
    "|| 45.00 || -45.00\n#{formatted_time} || 1.23 || || -43.77\n" \
    "#{formatted_time} || 123.65 || || 79.88\n"

    account.withdraw(45)
    account.deposit(1.23)
    account.deposit(123.65)

    expect { account.view_statement }.to output(statement).to_stdout
  end
end
