class GreaterThan < Arity2Operators
  Operator.register('>', GreaterThan, 8)

  def to_sql
    "(#{@left.to_sql} > #{@right.to_sql})"
  end

end
