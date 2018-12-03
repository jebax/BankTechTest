class BankAccount
  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def deposit(amount)
    @balance += amount
  end
  
  def view_statement
    'date || credit || debit || balance'
  end
end
