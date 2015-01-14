class LessThan < Arity2Operators
  Operator.register('<', LessThan, 8)

  def to_sql
    "(#{@left.to_sql} < #{@right.to_sql})"
  end

end
