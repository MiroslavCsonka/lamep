class GreaterThan < Arity2Operators
  Operator.register('>', GreaterThan, 8)

  def to_sql
    "(#{@left.to_sql} > #{@right.to_sql})"
  end


  def evaluate(attributes={})
    @left.evaluate(attributes).to_i > @right.evaluate(attributes).to_i
  end

end
