class BankAccount

  @@interest_rate = 0.0025
  @@accounts = []

  def self.create
    new_account = BankAccount.new
    @@accounts << new_account
    return new_account
  end

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

  def self.total_funds
    @@accounts.sum(&:balance)
  end
  # my original other ways to do this, thanks Sean!
  # def self.total_funds
  #   @@accounts.sum do |account|
  #     account.balance
  #   end
  # end
  # def self.total_funds
  #   total = 0
  #   @@accounts.each do |account|
  #     total += account.balance
  #   end
  #   return total
  # end
  def self.interest_time
    @@accounts.each do |account|
      account.deposit(account.balance * @@interest_rate)
    end
  end

end

jeff_account = BankAccount.create
moya_account = BankAccount.create

jeff_account.deposit(200)
moya_account.deposit(150)
#
puts jeff_account.inspect
puts moya_account.inspect

puts BankAccount.total_funds

BankAccount.interest_time
puts "after applying interest"
puts jeff_account.inspect
puts moya_account.inspect

puts BankAccount.total_funds
