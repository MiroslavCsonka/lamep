require './spec/spec_helper'

describe Operator do

  describe 'Generating sql statements' do
    describe UnaryMinus do
      it 'unary minus on int to SQL' do
        expect(UnaryMinus.new('180').to_sql).to be(-180)
      end

      it 'unary minus on string to SQL' do
        expect { UnaryMinus.new('ahoj').to_sql }.to raise_error(ArgumentError)
      end
    end

    describe Equal do
      it 'simple case' do
        expect(Equal.new('price', '180').to_sql).to eq '(price = 180)'
      end
    end

    describe GreaterThan do
      it 'simple case' do
        expect(GreaterThan.new('price', '180').to_sql).to eq '(price > 180)'
      end
    end

    describe GreaterThanEqual do
      it 'simple case' do
        expect(GreaterThanEqual.new('price', '180').to_sql).to eq '(price >= 180)'
      end
    end

    describe LessThan do
      it 'simple case' do
        expect(LessThan.new('price', '180').to_sql).to eq '(price < 180)'
      end
    end

    describe LessThanEqual do
      it 'simple case' do
        expect(LessThan.new('price', '180').to_sql).to eq '(price < 180)'
      end
    end

    describe NotEqual do
      it 'simple case' do
        expect(NotEqual.new('price', '180').to_sql).to eq '(price != 180)'
      end
    end

    describe Or do
      it 'Nested case' do
        expression = Or.new(Equal.new('price', UnaryMinus.new('180')), Equal.new('Group', 'Tabák'))
        expect(expression.to_sql).to eq '((price = -180) OR (Group = Tabák))'
      end
    end

    describe And do
      it 'Nested case' do
        expression = And.new(Equal.new('price', UnaryMinus.new('180')), Equal.new('Group', 'Tabák'))
        expect(expression.to_sql).to eq '((price = -180) AND (Group = Tabák))'
      end
    end

    it 'Composite case' do
      expect(And.new(
                 Equal.new('materiál', 'dřevo'),
                 Or.new(
                     GreaterThan.new('cena', '180'),
                     GreaterThanEqual.new('cena', '250')
                 )
             ).to_sql).to eq '((materiál = dřevo) AND ((cena > 180) OR (cena >= 250)))'
    end

  end

end
