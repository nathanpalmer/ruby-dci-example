class MoneyTransfer
  include DCI::Context

  def perform(source_id, destination_id, amount)
    source = Account.find(source_id)
    destination = Account.find(destination_id)
    amount = amount

    characterize source.as(Transferrer), destination.as(Transferee) do
      source.transfer_to(destination, amount)
    end

    source
  end

end