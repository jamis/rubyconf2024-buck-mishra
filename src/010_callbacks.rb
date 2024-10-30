class Child
  embedded_in :parent
  after_save :do_something

  def do_something
    # ... something ...
  end
end

parent.children = Array.new(N) { Child.new }
parent.save
