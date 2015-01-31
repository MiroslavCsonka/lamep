class TokenAnnotator
  def initialize(tokens)
    @tokens = tokens
  end

  def annotate
    @tokens.map do |token|
      case token
        when /^"#{TokenParser::ANY_WORD}"$/
          Operands::String.new(token[1..-2])
        when /^[0-9]+$/
          Operands::Number.new(token.to_i)
        when /^#{TokenParser::ANY_WORD}$/
          Operands::Variable.new(token)
        when /^[(]$/
          Operands::LeftParentheses
        when /^[)]$/
          Operands::RightParentheses
        else
          fail ArgumentError, "Unsupported token #{token} with type #{token.class}"
      end
    end
  end
end