class BankAccount
  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    @statement.add_transaction(
      deposit: amount.to_f, withdrawal: nil, balance: @balance.to_f
    )
  end

  def withdraw(amount)
    @balance -= amount
    @statement.add_transaction(
      deposit: nil, withdrawal: amount.to_f, balance: @balance.to_f
    )
  end

  def view_statement
    @statement.display
  end
end
