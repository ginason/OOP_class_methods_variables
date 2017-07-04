
class Bankaccount

  @@interest_rate = 1.01
  @@accounts = []

  def initialize(name)
  @balance = 0
  @new_name = name
  end

  def self.create(new_name)
    new_account = Bankaccount.new(new_name)
    @@accounts << new_account
    return new_account
  end

  def self.accounts
    @@accounts
  end

  def self.total_funds
    sum = 0
    @@accounts.each do |account|
      sum = sum + account.balance
    end
    puts "#{sum}"
  end


#writer should connect to self.interest_time
  def self.interest_time
    @@accounts.each do |account|
      # account.balance = @@interest_rate * account.balance
      account.balance_new(@@interest_rate * account.balance)
    end
  end

  def balance_new(amount)
    @balance=amount
  end

  def balance
    @balance
  end

  # def balance=(amount)
  #   @balance = amount
  # end

  def deposit(moneny_of_deposit)
    @balance += moneny_of_deposit
  end

  def withdraw(moneny_of_withdraw)
    @balance = @balance - moneny_of_withdraw
  end

  # def self.total_funds
  #
  #   @@accounts.each do |i|
  #     puts i
  #   end
  # end

end

my_account = Bankaccount.create("my_account")
your_account = Bankaccount.create("your_account")

puts my_account.balance
puts Bankaccount.total_funds

my_account.deposit(200)
your_account.deposit(1000)

puts my_account.balance
puts your_account.balance

puts Bankaccount.total_funds

Bankaccount.interest_time

puts my_account.balance
puts your_account.balance

puts Bankaccount.total_funds
my_account.withdraw(50)

puts my_account.balance
puts Bankaccount.total_funds
