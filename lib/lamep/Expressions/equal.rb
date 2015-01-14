class Equal < Arity2Operators
  Operator.register('=', Equal, 9)

  def to_sql
    "(#{@left.to_sql} = #{@right.to_sql})"
  end

end
