# LAMEP

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'lamep'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lamep

## Usage

# Basic Usage

You can use lamep for:

1. Parsing expression into array of tokens:

  ```ruby
  # Splits expression into single tokens
  tokens = TokenParser.new.parse('material = wood && (price > 180 || price <= 250)')
  ```
  Variable `tokens` will be array of tokens:
   ```ruby
  %w{material = wood && ( price > 180 || price <= 250 )}
  ```

2. Converting tokens into postfix notation:

  ```ruby
  # Converts tokens into postfix notation (also known as RPN)
  postfix = ShuntingYard.new(tokens).posfix
  ```
  Variable `postfix` will be array of tokens in postfix notation:
  ```ruby
  %w{material wood = price 180 > price 250 <= || &&}
   ```

3. Building Abstract Syntax Tree:

  ```ruby
  # Builds tree from postfix
  ast = AbstractSyntaxTreeBuilder.new(postfix).build_tree
  ```
  Variable `ast` will be containing such structure:
    ```ruby
  And.new(
    Equal.new('material', 'wood'),
    Or.new(
      GreaterThan.new('price', '180'),
      LessThanEqual.new('price', '250')
    )
  )
	 ```
4. Building SQL WHERE clause:

  ```ruby
  # Builds SQL WHERE clause
  sql_where = ast.to_sql
  ```
  Variable `sql_where` will be string:
  ```ruby
  '((material = wood) AND ((price > 180) OR (price <= 250)))'
  ```

# Supported operators

At this point we support following list of operators and their SQL conversion:

operator | description
---------|--------------
**=**    | *Equal*
**!=**   | *Not Equal*
**>**    | *Greater Than*
**>=**   | *Greater Than Equal*
**<**    | *Less Than*
**<=**   | *Less Than Equal*
**&&**   | *Logical AND*
**\|\|**   | *Logical OR*
**-**  | *Unary Minus*

The rest of passed expression is considered as an operand i.e. either variable or a number.

# Adding your own operators
TODO:


## Contributing

1. Fork it ( https://github.com/forex-kaiz/lamep/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
