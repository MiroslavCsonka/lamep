class ValueExpression < Arity1Operators

  def initialize(operand)
    @operand = operand
  end

  def to_sql
    operand
  end

  def evaluate(attributes = {})
    if attributes.key? @operand
      attributes[@operand]
    else
      @operand
    end
  end

end