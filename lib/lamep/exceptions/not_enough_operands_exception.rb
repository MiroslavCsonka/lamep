class NotEnoughOperandsException < Exception

  attr_reader :expression

  def initialize(*argv)
    @expression = argv[0].fetch(:expression)
    super
  end

end