class Operator

  OPERATORS = {}

  def self.factory!(operator_symbol)
    if OPERATORS.key?(operator_symbol)
      OPERATORS[operator_symbol][:class_name]
    else
      fail "Unregistered operator: #{operator_symbol}"
    end
  end

  def self.precedence!(operator_symbol)
    fail("Non-existent operator #{operator_symbol}") unless OPERATORS.key?(operator_symbol)
    OPERATORS[operator_symbol][:precedence]
  end

  def self.register(operator_symbol, class_name, precedence)
    OPERATORS[operator_symbol] = { class_name: class_name, precedence: precedence }
  end

  def to_sql
    raise NotImplementedError
  end

end
