require 'active_record'
require_relative '../../lib/castable'

class Account < ActiveRecord::Base
  include Castable
end