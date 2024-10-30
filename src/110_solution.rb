# font_size: 24

def run_embedded_callbacks(operation, children, &block)
  fibers = children.map do |child|
    Fiber.new do
      child.run_callbacks(operation) do
        Fiber.yield
      end
    end
  end

  fibers.each(&:resume)

  yield

  fibers.reverse_each(&:resume)
end
