class Or < Arity2Operators
  Operator.register('||', Or, 14)

  def to_sql
    "(#{@left.to_sql} OR #{@right.to_sql})"
  end
end
