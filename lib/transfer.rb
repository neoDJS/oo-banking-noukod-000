class TypeMismatchError < TypeError; end
class Transfer
  # your code here
  def initialize(from, to, amount)
    raise TypeMismatchError, "Sender object class is #{from.class}, BankAccount expected" if !from.is_a?(BankAccount)
    raise TypeMismatchError, "Receiver object class is #{to.class}, BankAccount expected" if !to.is_a?(BankAccount)
    @sender = from
    @receiver = to
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if (@status == pending)
      @sender.deposit(-1*@amount) if @sender.balance > @amount
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end
end
