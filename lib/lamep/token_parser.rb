class TokenParser

  ANY_WORD = '[a-zA-Záäéëěíóöôúůüýčďňřšťžĺľ0-9]+'

  def parse(input)
    regexp = /^<
                    |(>=)|
                    (<=)|
                    (!=)|
                    ("#{ANY_WORD}")|
                    (#{ANY_WORD})|
                    (=)|
                    (>)|
                    (<)|
                    (\d+)|
                    (\()|
                    (\))|
                    (&&)|
                    (\|\|)|
                  >+$/x
    input.scan(regexp).flatten.compact
  end

end
