class TransactionList
  def initialize(transaction_class = Transaction)
    @transaction_class = transaction_class
    @transactions = []
  end

  def transactions
    @transactions.dup
  end

  def add_transaction(deposit: nil, withdrawal: nil, balance:)
    @transactions << @transaction_class.new(
      deposit: deposit, withdrawal: withdrawal, balance: balance
    )
  end
end
