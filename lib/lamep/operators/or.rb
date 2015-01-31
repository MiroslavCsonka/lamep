class Or < Arity2Operators
  register('||', Or, 14, /[|]{2}/)

  def to_sql
    "(#{@left.to_sql} OR #{@right.to_sql})"
  end

  def evaluate(attributes={})
    !!@left.evaluate(attributes) || !!@right.evaluate(attributes)
  end
end
