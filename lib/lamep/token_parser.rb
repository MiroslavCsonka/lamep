class TokenParser

  def parse(input)
    input.scan(/^<
                    |(>=)|
                    (<=)|
                    (!=)|
                    ([a-zA-Záäéëěíóöôúůüýčďňřšťžĺľ]+)|
                    (=)|
                    (>)|
                    (<)|
                    (\d+)|
                    (\()|
                    (\))|
                    (&&)|
                    (\|\|)|
                  >+$/x)
    .flatten
    .compact
  end

end
