class ShuntingYard

  def initialize(tokens)
    fail ArgumentError.new("Expected array: Got #{tokens.class}") unless tokens.is_a?(Array)
    @tokens = tokens
  end

  def postfix
    # Performs Shunting-yard algorithm
    output = []
    stack = []
    bracket_sum = 0
    @tokens.each do |token|
      case token
      when '('
        stack << token
        bracket_sum += 1
      when ')'
        bracket_sum -= 1
        fail('Right parentheses mismatch') if  bracket_sum < 0
        while stack.length > 0
          pop = stack.pop
          if pop == '('
            break
          end
          output << pop
        end
      else
        begin
          Operator.factory!(token)
          loop do
            length = stack.length
            if length == 0 || stack[length - 1] == '('
              stack << token
              break
            end
            # Token has higher priority than top of stack
            if Operator.precedence!(token) < Operator.precedence!(stack[length - 1])
              stack << token
              break
            else
              output << stack.pop
            end
          end
        rescue
          output << token
        end
      end
    end
    fail('Left parentheses mismatch') if bracket_sum > 0
    stack.length.times do
      output << stack.pop
    end
    output
  end

end
