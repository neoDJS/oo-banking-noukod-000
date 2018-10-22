class TypeMismatchError < TypeError; end
class Transfer
  # your code here
  attr_reader :sender, :receiver, :status, :amount
  def initialize(from, to, amount)
    raise TypeMismatchError, "Sender object class is #{from.class}, BankAccount expected" if !from.is_a?(BankAccount)
    raise TypeMismatchError, "Receiver object class is #{to.class}, BankAccount expected" if !to.is_a?(BankAccount)
    @sender = from
    @receiver = to
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? && (status == "pending")
  end

  def execute_transaction
    if self.valid?
      @sender.deposit(-1*@amount) if @sender.balance > @amount
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
    end
  end

  def reverse_transfer
    if(@status == "complete")
      @receiver.deposit(-1*@amount) if @receiver.balance > @amount
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
end
