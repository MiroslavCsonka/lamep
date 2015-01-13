require './spec/spec_helper'

describe ShuntingYard do
	def returns(tokens, postfix)
		expect(ShuntingYard.new(tokens).postfix).to eq(postfix)
	end

	it 'empty input' do
		returns [], []
	end

	it 'single operand' do
		returns ['drevo'], ['drevo']
	end

	it 'wrong input' do
		expect { ShuntingYard.new({}).postfix }.to raise_error(ArgumentError)
		expect { ShuntingYard.new(5).postfix }.to raise_error(ArgumentError)
		expect { ShuntingYard.new(nil).postfix }.to raise_error(ArgumentError)
		expect { ShuntingYard.new('ahoj').postfix }.to raise_error(ArgumentError)
	end

	it 'private constant' do
		expect { ShuntingYard::OPERATORS }.to raise_error(NameError)
	end

	it 'simple eq' do
		returns %w(material = drevo), %w(material drevo =)
	end

	it 'empty brackets' do
		returns %w(( )), []
	end

	it 'brackets' do
		returns %w(( cena > 180 )), %w(cena 180 >)
		returns %w(( ( cena ) > ( 180 ) )), %w(cena 180 >)
		expect { ShuntingYard.new(%w{( cena ) > 180 )}).postfix }.to raise_error(RuntimeError)
		expect { ShuntingYard.new(%w{((( cena ) > 180 )}).postfix }.to raise_error(RuntimeError)
	end

	it 'difficult cases' do
		returns %w{material = drevo && ( cena > 180 || cena >= 250 )},
		        %w{material drevo = cena 180 > cena 250 >= || &&}
		returns %w{( A || - B ) && C}, %w{A B - || C &&}
		returns %w{( ) ( ( cena = - 150 ) ) ( )}, %w{cena 150 - =}
		returns %w{- A = 150 || B && C}, %w{A - 150 = B C && ||}
	end

	it 'czech operands' do
		returns %w{dřevo < polička}, %w{dřevo polička <}
	end
end