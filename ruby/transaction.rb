# Idea: let objects have transactions like databases do.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

# PLEASE NOTE: THIS CODE DOESN'T WORK CORRECTLY
module Transactionable
  def transaction(*objects, &block)
    copy = objects.dup
    begin
      return yield
    rescue
      return *copy
    end
  end
end

class BankAccount
  attr_reader :balance
  include Transactionable

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    if @balance - amount >= 0.0
      @balance -= amount
    else
      raise "Not enough funds"
    end
  end

  def transfer_to(bank_account, amount)
    bank_account = transaction(bank_account) do
      bank_account.deposit(amount)
      withdraw(amount)
    end
  end
end

john = BankAccount.new(25.0)
jane = BankAccount.new(25.0)

# john.transfer_to(jane, 25.0)
jane.transfer_to(john, 26.0)

puts john.balance
puts jane.balance

