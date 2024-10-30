# font_size: 24

def foo ; puts 'enter foo' ; yield; puts 'exit foo' ; end
def bar ; puts 'enter bar' ; yield; puts 'exit bar' ; end
def baz ; puts 'enter baz' ; yield; puts 'exit baz' ; end
def bang; puts 'enter bang'; yield; puts 'exit bang'; end

foo do
  bar do
    baz do
      bang do
        puts 'done'
      end
    end
  end
end

