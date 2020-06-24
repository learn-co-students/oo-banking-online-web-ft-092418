class Transfer

  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amt)
    self.sender = sender
    self.receiver = receiver
    self.amount = amt
    self.status = "pending"
  end 

  def valid?
    (self.sender.valid? && self.receiver.valid?) ? true : false
  end

  def execute_transaction
    
    if !valid? || self.sender.balance < self.amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "pending"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    return "Cannot reverse an uncompleted transfer." if self.status != "complete"
    self.sender.balance += self.amount
    self.receiver.balance -= self.amount
    self.status = "reversed"
  end
end
