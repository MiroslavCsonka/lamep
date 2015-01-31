require_relative '../../spec_helper'

describe TokenAnnotator do

  def returns(input, output)
    expect(TokenAnnotator.new(input).annotate).to match output
  end

  context :operands do
    it 'annotates string' do
      returns ['"something"', '"else"'], [Operands::String.new('something'), Operands::String.new('else')]
    end

    it 'annotates numbers' do
      returns ['1', '99'], [Operands::Number.new(1), Operands::Number.new(99)]
    end

    it 'variable' do
      returns ['material', 'price'], [Operands::Variable.new('material'), Operands::Variable.new('price')]
    end

    it 'multiple' do
      returns ['"wood"', 'price', '5'], [Operands::String.new('wood'), Operands::Variable.new('price'), Operands::Number.new(5)]
    end
  end

  context :parentheses do
    it 'left' do
      returns ['('], [Operands::LeftParentheses]
    end
    it 'right' do
      returns [')'], [Operands::RightParentheses]
    end
  end

end