require "pry"
class Transfer
  attr_accessor :sender, :receiver, :amount, :status 
  @@all = []
  
  def initialize(sender, receiver, amount, status = "pending")
    self.sender = sender
    self.receiver = receiver 
    self.amount = amount
    self.status = status
  end 
  
  def valid? 
    receiver.valid? && sender.valid? 
  end 
  
  def execute_transaction 
    #binding.pry
    if !@@all.include?(self) && self.sender.balance >= self.amount
      sender.balance -= amount 
      receiver.balance += amount
      @@all << self
      self.status = "complete"
      
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer 
    if @@all.include?(self)
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end 
  end 
  
end
