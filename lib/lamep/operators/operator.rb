class Operator

  OPERATORS = {}

  def self.factory!(operator_symbol)
    operator(operator_symbol)[:class_name]
  end

  def self.precedence!(operator_symbol)
    operator(operator_symbol)[:precedence]
  end

  def self.operator(operator_symbol)
    fail "Unregistered operator: #{operator_symbol}" unless exists?(operator_symbol)
    OPERATORS[operator_symbol]
  end

  def self.exists?(operator_symbol)
    OPERATORS.key?(operator_symbol)
  end

  def self.register(operator_symbol, class_name, precedence)
    OPERATORS[operator_symbol] = { class_name: class_name, precedence: precedence }
  end

  def to_sql
    raise NotImplementedError
  end

  def evaluate(attributes = {})
    raise NotImplementedError
  end

end
