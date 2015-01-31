require_relative 'lamep/operands/operand'

require_relative 'lamep/exceptions/not_enough_operands_exception'
require_relative 'lamep/exceptions/not_enough_operators_exception'
require_relative 'lamep/exceptions/missing_left_parentheses_error'
require_relative 'lamep/exceptions/missing_right_parentheses_error'
require_relative 'lamep/operators/operator'
require_relative 'lamep/operators/arity1_operators'
require_relative 'lamep/operators/arity2_operators'
require_relative 'lamep/operators/value_expression'
require_relative 'lamep/token_parser'
require_relative 'lamep/shunting_yard'
require_relative 'lamep/operators/equal'
require_relative 'lamep/operators/greater_than'
require_relative 'lamep/operators/less_than'
require_relative 'lamep/operators/greater_than_equal'
require_relative 'lamep/operators/less_than_equal'
require_relative 'lamep/operators/and'
require_relative 'lamep/operators/or'
require_relative 'lamep/operators/unary_minus'
require_relative 'lamep/operators/not_equal'
require_relative 'lamep/abstract_syntax_tree_builder'
require_relative 'lamep/token_annotator'

class Lamep
  def evaluate(expression, attributes={})
    tokens = TokenParser.new.parse(expression)
    postfix = ShuntingYard.new(tokens).postfix
    AbstractSyntaxTreeBuilder.new(postfix).build_tree.evaluate(attributes)
  end
end