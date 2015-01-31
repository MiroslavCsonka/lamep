class And < Arity2Operators
  register('&&', And, 13, /[&]{2}/)

  def to_sql
    "(#{@left.to_sql} AND #{@right.to_sql})"
  end

  def evaluate(attributes={})
    !!@left.evaluate(attributes) && !!@right.evaluate(attributes)
  end

end
