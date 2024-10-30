parent.children = Array.new(1_000) { Child.new }
parent.save
#=> "stack level too deep (SystemStackError)"
