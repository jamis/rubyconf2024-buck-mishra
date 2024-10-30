# font_size: 24

def make_fiber(name)
  Fiber.new { send(name) { Fiber.yield } }
end

fibers = %i[ foo bar baz bang ].map { |name| make_fiber(name) }

fibers.each(&:resume)

puts 'done'

fibers.reverse_each(&:resume)
