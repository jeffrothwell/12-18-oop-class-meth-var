class BankAccount

  @@interest_rate = 0.0025
  @@accounts = []

  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
