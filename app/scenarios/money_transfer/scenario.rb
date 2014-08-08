class MoneyTransfer
  include Scenario

  def initialize(source_id, destination_id, amount)
    @source = Account.find(source_id)
    @destination = Account.find(destination_id)
    @amount = amount
  end

  def execute
    cast @source.as(Transferrer), @destination.as(Transferrer) do
      @source.transfer_to(@destination, @amount)
    end
    @source
  end

end