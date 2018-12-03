class BankAccount
  def initialize(transaction_list = TransactionList.new,
                 statement_class = Statement)
    @balance = 0
    @statement = nil
    @statement_class = statement_class
    @transaction_list = transaction_list
  end

  def deposit(amount)
    @balance += amount
    @transaction_list.add_transaction(
      deposit: amount.to_f, withdrawal: nil, balance: @balance.to_f
    )
  end

  def withdraw(amount)
    @balance -= amount
    @transaction_list.add_transaction(
      deposit: nil, withdrawal: amount.to_f, balance: @balance.to_f
    )
  end

  def view_statement
    statement.display
  end

  private

  def statement
    @statement ||= @statement_class.new(@transaction_list)
  end
end
