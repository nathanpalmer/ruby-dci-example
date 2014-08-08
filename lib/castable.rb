require 'casting'

module Castable
  extend ActiveSupport::Concern

  included do
    include Casting::Client
    delegate_missing_methods
  end


  def as(role, &block)
    if block_given?
      Casting.delegating(self => role) do
        block.call(self)
      end
    else
      self.cast_as(role)
    end
  end

end