require 'casting'

module DCI

  module Context
    extend ActiveSupport::Concern

    included do
      def self.perform(*args)
        self.new.perform(*args)
      end
    end

    def characterize(*args, &block)
      yield
      args.each do |item|
        item.uncast
      end
    end
  end

end