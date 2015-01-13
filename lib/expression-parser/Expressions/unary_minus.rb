class UnaryMinus < Arity1Operators
  Operator.register('-', UnaryMinus, 3)

  def to_sql
    operand = @operand.to_sql
    fail(ArgumentError, ("#{operand} is not a number")) if operand !~ /^\d+$/
    -operand.to_i
  end

end
