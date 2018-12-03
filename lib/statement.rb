class Statement
  HEADERS = 'date || credit || debit || balance'.freeze

  def initialize(transaction_list)
    @transaction_list = transaction_list
  end

  def display
    HEADERS + "\n" + format_transaction_list.join("\n")
  end

  private

  def format_transaction_list
    @transaction_list.transactions.map do |transaction|
      format_data(transaction).join(' || ').sub('  ', ' ')
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
