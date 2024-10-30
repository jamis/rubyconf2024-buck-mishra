# font_size: 24

def run_embedded_callbacks(operation, children, &block)
  # invoke the block even if there are no children
  return yield if children.empty?

  head, *tail = children
  head.run_callbacks(operation) do
    if tail.empty?
      # invoke the block only when the list finishes
      yield
    else
      # otherwise, run the callbacks on the rest of the children
      run_embedded_callbacks(operation, tail, &block)
    end
  end
end
