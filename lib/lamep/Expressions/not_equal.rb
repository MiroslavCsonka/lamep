class NotEqual < Arity2Operators
  Operator.register('!=', NotEqual, 9)

  def to_sql
    "(#{@left.to_sql} != #{@right.to_sql})"
  end

end
