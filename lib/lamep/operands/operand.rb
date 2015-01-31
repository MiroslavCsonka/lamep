module Operands
  class Operand < Struct.new(:value)
  end
end

require_relative 'string'
require_relative 'number'
require_relative 'variable'
