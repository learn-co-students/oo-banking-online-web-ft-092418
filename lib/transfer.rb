class Transfer
  
  attr_reader :amount
  attr_accessor :status, :sender, :receiver
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 
  
  def valid?
    @sender.valid? && @receiver.valid?  #why??
  end 
  
  def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      (@sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete") unless @status == "complete"
    end
  end 
  
  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end 
end
