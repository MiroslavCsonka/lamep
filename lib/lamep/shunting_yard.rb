class ShuntingYard

  def initialize(tokens)
    fail ArgumentError.new("Expected array: Got #{tokens.class}") unless tokens.is_a?(Array)
    @tokens = tokens
  end

  def postfix
    @output = []
    @stack = []
    bracket_sum = 0
    @tokens.each do |token|
      case token
        when '('
          bracket_sum += 1
          @stack << token
        when ')'
          bracket_sum -= 1
          fail MissingLeftParenthesesError if bracket_sum < 0
          burn_stack_to_parentheses
        else
          if Operator.exists?(token)
            burn_stack_to_higher_precedence(token)
            @stack << token
          else
            @output << token
          end
      end
    end
    fail MissingRightParenthesesError if bracket_sum > 0
    @output += @stack.reverse
    @output
  end

  private def burn_stack_to_higher_precedence(token)
    until @stack.empty? || @stack.last == '(' || Operator.precedence!(token) < Operator.precedence!(@stack.last)
      @output << @stack.pop
    end
  end

  private def burn_stack_to_parentheses
    until @stack.empty?
      popped = @stack.pop
      break if popped == '('
      @output << popped
    end
  end

end
