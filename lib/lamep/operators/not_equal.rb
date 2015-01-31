class NotEqual < Arity2Operators
  register('!=', NotEqual, 9, /[!][=]/)

  def to_sql
    "(#{@left.to_sql} != #{@right.to_sql})"
  end

  def evaluate(attributes={})
    @left.evaluate(attributes) != @right.evaluate(attributes)
  end

end
