require './spec/spec_helper'

describe TokenParser do
  let(:parser) { TokenParser.new }

  def returns(string, tokens)
    expect(parser.parse(string)).to eq tokens
  end

  it 'empty input' do
    returns '', []
  end

  it 'single token' do
    returns 'attribute', %w(attribute)
  end

  it 'simple assertions' do
    returns 'weight > 0', %w(weight > 0)
  end

  it 'simple OR operator' do
    returns '    true     || false', %w(true || false)
  end

  it 'simple AND operator' do
    returns 'true && false', %w(true && false)
  end

  it 'supports strings' do
    returns 'kategorie = "neco"', %w(kategorie = "neco")
  end

  it 'complex case' do
    returns 'material = dřevo && (cena > 180 || cena >= 250)', %w(material = dřevo && ( cena > 180 || cena >= 250 ))
    returns '(material   != ocel ||     cena    =       30 &&     (  šlahounů >=   2 &&    šlahounů <=   5   ) ',
            %w{( material != ocel || cena = 30 && ( šlahounů >= 2 && šlahounů <= 5 )}
  end

end