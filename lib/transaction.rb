class Transaction
  attr_reader :deposit, :withdrawal, :balance, :time

  def initialize(deposit:, withdrawal:, balance:)
    @time = Time.now
    @deposit = deposit
    @withdrawal = withdrawal
    @balance = balance
  end

  def data
    [@time, @deposit, @withdrawal, @balance]
  end
end
