module Operands
  class Operand < Struct.new(:value)
  end
end

require_relative 'string'
require_relative 'number'
require_relative 'variable'
require_relative 'left_parentheses'
require_relative 'right_parentheses'