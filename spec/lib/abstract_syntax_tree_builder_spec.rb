require './spec/spec_helper'

describe AbstractSyntaxTreeBuilder do
	def returns(postfix, tree)
		expect(AbstractSyntaxTreeBuilder.new(postfix).build_tree).to be(tree)
	end

	it 'equal case' do
		returns %w(materiál dřevo =), Equal.new('materiál', 'dřevo')
	end

	it 'gt case' do
		returns %w(materiál 180 >), GreaterThan.new('materiál', '180')
	end

	it 'lt case' do
		returns %w(materiál 180 <), LessThan.new('materiál', '180')
	end

	it 'gte case' do
		returns %w(materiál 180 >=), GreaterThanEqual.new('materiál', '180')
	end

	it 'lte case' do
		returns %w(materiál 180 <=), LessThanEqual.new('materiál', '180')
	end

	it '&& case' do
		returns %w(materiál 180 &&), And.new('materiál', '180')
	end

	it '|| case' do
		returns %w(materiál 180 ||), Or.new('materiál', '180')
	end

	it '!= case' do
		returns %w(materiál 180 !=), NotEqual.new('materiál', '180')
	end

	it '- case' do
		returns %w(180 -), UnaryMinus.new('180')
	end

	it 'composite cases' do
		returns %w(materiál dřevo = cena 180 > &&),
		        And.new(Equal.new('materiál', 'dřevo'), GreaterThan.new('cena', '180'))

		returns %w{materiál dřevo = cena 180 > cena 250 >= || &&},
		        And.new(
				        Equal.new('materiál', 'dřevo'),
				        Or.new(
						        GreaterThan.new('cena', '180'),
						        GreaterThanEqual.new('cena', '250')
				        )
		        )

	end

	it 'only operands' do
		expect {AbstractSyntaxTreeBuilder.new(%w(materiál cena)).build_tree }.to raise_error(RuntimeError)
	end

	it 'only operators' do
		expect {AbstractSyntaxTreeBuilder.new(%w(&& -)).build_tree }.to raise_error(RuntimeError)
	end

end
