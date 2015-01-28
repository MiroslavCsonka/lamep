class And < Arity2Operators
  Operator.register('&&', And, 13)

  def to_sql
    "(#{@left.to_sql} AND #{@right.to_sql})"
  end

  def evaluate(attributes={})
    !!@left.evaluate(attributes) && !!@right.evaluate(attributes)
  end

end
