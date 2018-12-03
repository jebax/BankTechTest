class Statement
  HEADERS = %w[date credit debit balance].freeze
  DIVIDER = ' || '.freeze

  def initialize(transaction_list = TransactionList.new)
    @transaction_list = transaction_list
  end

  def add_transaction(deposit:, withdrawal:, balance:)
    @transaction_list.add_transaction(
      deposit: deposit, withdrawal: withdrawal, balance: balance
    )
  end

  def display
    HEADERS.join(DIVIDER) + "\n" + format_transaction_list.join("\n")
  end

  private

  def format_transaction_list
    @transaction_list.transactions.map do |transaction|
      format_data(transaction).join(DIVIDER).sub('  ', ' ')
    end
  end

  def format_data(transaction)
    transaction.data.map do |data|
      if data.is_a? Time
        data.strftime('%d/%m/%Y')
      elsif data.is_a? Float
        format('%.2f', data)
      end
    end
  end
end
