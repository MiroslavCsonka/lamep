class Equal < Arity2Operators
  register('=', Equal, 9, /[=]/)

  def to_sql
    "(#{@left.to_sql} = #{@right.to_sql})"
  end

  def evaluate(values = {})
    @left.evaluate(values) == @right.evaluate(values)
  end

end
