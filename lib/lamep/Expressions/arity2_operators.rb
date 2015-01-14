class Arity2Operators < Operator

  attr_reader :left, :right
  ARITY = 2

  def initialize(left, right)
    @left = (left.is_a?(Operator)) ? left : ValueExpression.new(left)
    @right = (right.is_a?(Operator)) ? right : ValueExpression.new(right)
  end

  def ==(other)
    other.class == self.class && other.left == @left && other.right == @right
  end

  alias_method :equal?, :==

end
