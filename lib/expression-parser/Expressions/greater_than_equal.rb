class GreaterThanEqual < Arity2Operators
  Operator.register('>=', GreaterThanEqual, 8)

  def to_sql
    "(#{@left.to_sql} >= #{@right.to_sql})"
  end

end
