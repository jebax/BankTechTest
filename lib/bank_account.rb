class BankAccount
  HEADERS = 'date || credit || debit || balance'.freeze

  attr_reader :balance

  def initialize(statement = Statement.new)
    @balance = 0.0
    @transactions = []
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    @transactions << [Time.now, nil, amount.to_f, @balance]
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << [Time.now, amount.to_f, nil, @balance]
  end

  def view_statement
    @statement.display
  end
end
