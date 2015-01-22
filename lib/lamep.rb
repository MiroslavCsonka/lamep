require_relative 'lamep/exceptions/not_enough_operands_exception'
require_relative 'lamep/exceptions/not_enough_operators_exception'
require_relative 'lamep/exceptions/missing_left_parentheses_error'
require_relative 'lamep/exceptions/missing_right_parentheses_error'
require_relative 'lamep/Expressions/operator'
require_relative 'lamep/Expressions/arity1_operators'
require_relative 'lamep/Expressions/arity2_operators'
require_relative 'lamep/Expressions/value_expression'
require_relative 'lamep/token_parser'
require_relative 'lamep/shunting_yard'
require_relative 'lamep/Expressions/equal'
require_relative 'lamep/Expressions/greater_than'
require_relative 'lamep/Expressions/less_than'
require_relative 'lamep/Expressions/greater_than_equal'
require_relative 'lamep/Expressions/less_than_equal'
require_relative 'lamep/Expressions/and'
require_relative 'lamep/Expressions/or'
require_relative 'lamep/Expressions/unary_minus'
require_relative 'lamep/Expressions/not_equal'
require_relative 'lamep/abstract_syntax_tree_builder'

class Lamep
  def evaluate(expression, attributes={})
    tokens = TokenParser.new.parse(expression)
    postfix = ShuntingYard.new(tokens).postfix
    AbstractSyntaxTreeBuilder.new(postfix).build_tree.evaluate(attributes)
  end
end