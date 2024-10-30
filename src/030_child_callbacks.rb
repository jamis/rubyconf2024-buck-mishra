# font_size: 24

def save
  run_embedded_callbacks(:save, get_all_embedded_children) do
    really_actually_save
  end
end

# not correct!
#   - block won't be called if there are no children
#   - block could be invoked too many times (once for each child)
def run_embedded_callbacks(operation, children)
  children.each do |child|
    child.run_callbacks(operation) do
      yield
    end
  end
end

