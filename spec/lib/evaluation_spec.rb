require './spec/spec_helper'

describe 'Evaluating of expressions' do

  def matches?(filter, values={})
    tokens = TokenParser.new.parse(filter)
    postfix = ShuntingYard.new(tokens).postfix
    AbstractSyntaxTreeBuilder.new(postfix).build_tree.evaluate(values)
  end

  describe Equal do

    it 'is false' do
      expect(matches?('true = false')).to eq false
      expect(matches?('true = true')).to eq true
    end

    it 'replacing value holders with actual values' do
      expect(matches?('name = mirek', { 'name' => 'mirek' })).to eq true
      expect(matches?('name = mirek', { 'name' => 'Tomáš' })).to eq false
    end

  end


  it GreaterThan do
    expect(matches?('price > 200', { 'price' => '300' })).to eq true
    expect(matches?('price > 200', { 'price' => 150 })).to eq false
  end

  it LessThan do
    expect(matches?('(price < 200)', { 'price' => 150 })).to eq true
    expect(matches?('(price < 200)', { 'price' => 500 })).to eq false
  end

  it GreaterThanEqual do
    expect(matches?('price >= 200', { 'price' => '200' })).to eq true
    expect(matches?('price >= 200', { 'price' => 201 })).to eq true
    expect(matches?('price >= 200', { 'price' => 199 })).to eq false
  end

  it LessThanEqual do
    expect(matches?('(price <= 200)', { 'price' => 201 })).to eq false
    expect(matches?('(price <= 200)', { 'price' => 200 })).to eq true
    expect(matches?('(price <= 200)', { 'price' => 199 })).to eq true
  end

  it And do
    expect(matches?('(price > 200) && price < 500', { 'price' => 400 })).to eq true
  end

  it NotEqual do
    expect(matches?('name != mirek')).to eq true
    expect(matches?('name != name')).to eq false
  end

  it Or do
    expect(matches?('(price > 200) || (category = 1)', { 'price' => 0, 'category' => '1' })).to eq true
    expect(matches?('price > 200 || category = 1', { 'price' => '0', 'category' => '0' })).to eq false
  end

  it UnaryMinus do
    expect(matches?('-1 = -(1)', {})).to eq true
  end

end