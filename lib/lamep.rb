require './lib/lamep/exceptions/not_enough_operands_exception'
require './lib/lamep/exceptions/not_enough_operators_exception'
require './lib/lamep/exceptions/missing_left_parentheses_error'
require './lib/lamep/exceptions/missing_right_parentheses_error'
require './lib/lamep/Expressions/operator'
require './lib/lamep/Expressions/arity1_operators'
require './lib/lamep/Expressions/arity2_operators'
require './lib/lamep/Expressions/value_expression'
require './lib/lamep/token_parser'
require './lib/lamep/shunting_yard'
require './lib/lamep/Expressions/equal'
require './lib/lamep/Expressions/greater_than'
require './lib/lamep/Expressions/less_than'
require './lib/lamep/Expressions/greater_than_equal'
require './lib/lamep/Expressions/less_than_equal'
require './lib/lamep/Expressions/and'
require './lib/lamep/Expressions/or'
require './lib/lamep/Expressions/unary_minus'
require './lib/lamep/Expressions/not_equal'
require './lib/lamep/abstract_syntax_tree_builder'

class Lamep
  def evaluate(expression, attributes={})
    tokens = TokenParser.new.parse(expression)
    postfix = ShuntingYard.new(tokens).postfix
    AbstractSyntaxTreeBuilder.new(postfix).build_tree.evaluate(attributes)
  end
end