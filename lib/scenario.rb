require 'casting'

module Scenario
  extend ActiveSupport::Concern

  def characterize(*args, &block)
    yield
    args.each do |item|
      item.uncast
    end
  end
end