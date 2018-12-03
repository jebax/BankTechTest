class TransactionList
  def initialize
    @transactions = []
  end

  def transactions
    @transactions.dup
  end
end
