require 'casting'

module Scenario
  extend ActiveSupport::Concern

  included do
    def self.perform(*args)
      self.new.perform(*args)
    end
  end

  def cast(*args, &block)
    yield
    args.each do |item|
      item.uncast
    end
  end
end