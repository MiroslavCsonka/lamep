class LessThanEqual < Arity2Operators
  Operator.register('<=', LessThanEqual, 8)

  def to_sql
    "(#{@left.to_sql} <= #{@right.to_sql})"
  end

end
