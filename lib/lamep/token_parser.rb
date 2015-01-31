class TokenParser

  ANY_WORD = '[a-zA-Záäéëěíóöôúůüýčďňřšťžĺľ0-9]+'

  def parse(input)
    regexp = "(\"#{ANY_WORD}\")|(#{ANY_WORD})|([0-9]+)|([(])|([)])|"

    operators = Operator::OPERATORS.values
                    .sort_by { |a, b| a.to_s.length <=> b.to_s.length }
                    .reverse
                    .map { |o| "(#{o.fetch(:regexp).to_s})" }
                    .join('|')

    string = "/^<|#{operators}|#{regexp}|>+$/x"

    r = Regexp.new(string)
    input.scan(r).flatten.compact
  end

end
