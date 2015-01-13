class Arity1Operators < Operator

  attr_reader :operand
  ARITY = 1

  def ==(other)
    other.class == self.class && other.operand == @operand
  end

  def initialize(operand)
    @operand = (operand.is_a?(Operator)) ? operand : ValueExpression.new(operand)
  end

  alias_method :equal?, :==

end
