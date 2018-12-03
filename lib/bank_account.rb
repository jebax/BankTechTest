class BankAccount
  HEADERS = 'date || credit || debit || balance'.freeze

  def initialize
    @balance = 0.0
    @transactions = []
  end

  attr_reader :balance

  def deposit(amount)
    @balance += amount
    @transactions << [Time.now, nil, amount.to_f, @balance]
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << [Time.now, amount.to_f, nil, @balance]
  end

  def view_statement
    HEADERS + "\n" +
      @transactions.map { |transaction| format_transaction(transaction) }
                   .join("\n")
  end

  private

  def format_transaction(transaction)
    formatted = transaction.map do |section|
      if section.is_a? Float
        format('%.2f', section)
      elsif section.is_a? Time
        section.strftime('%d/%m/%Y')
      end
    end

    formatted.join(' || ').sub('  ', ' ')
  end
end
