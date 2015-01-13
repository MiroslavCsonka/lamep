class ValueExpression < Arity1Operators

  def initialize(operand)
    @operand = operand
  end

  def to_sql
    operand
  end

end