class Transfer

 attr_accessor :sender, :receiver, :status, :amount, :bankaccount
 
 @@all = []
 
  def initialize(sender, receiver, status= "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount 
  end 

  def save 
    @@all << self.amount
  end 

  def valid?
    self.sender.valid? && self.receiver.valid?
  end 

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def execute_transaction
    if valid? && self.sender.balance >= self.amount
      while status == "pending"
        self.sender.balance -= amount
        self.receiver.balance += amount
        self.status = "complete"
        true
      end
    else
      reject_transfer
    end
  end 

  def reverse_transfer
    if status == "complete"
      self.receiver.balance -= amount
      self.sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end 

end
