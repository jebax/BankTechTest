class Statement
  HEADERS = %w[date credit debit balance].freeze
  DIVIDER = ' || '.freeze

  def initialize(transaction_list)
    @transaction_list = transaction_list
  end

  def display
    puts HEADERS.join(DIVIDER)
    puts format_transaction_list
  end

  private

  def format_transaction_list
    @transaction_list.transactions.map do |transaction|
      format_data(transaction).join(DIVIDER).sub('  ', ' ')
    end
  end

  def format_data(transaction)
    transaction.data.map do |item|
      if item.is_a? Time
        item.strftime('%d/%m/%Y')
      elsif item.is_a? Float
        format('%.2f', item)
      end
    end
  end
end
