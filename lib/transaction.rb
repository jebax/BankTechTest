class Transaction
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
