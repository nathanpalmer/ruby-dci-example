require 'active_support'

module Transferrer
  extend ActiveSupport::Concern

  def transfer_to(destination, amount)
    self.decrement!(:balance, amount)
    destination.increment!(:balance, amount)
    self
  end
end