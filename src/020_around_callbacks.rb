class Child
  embedded_in :parent
  around_save :do_something

  def do_something
    # ... something ...

    yield

    # ... something else ...
  end
end
