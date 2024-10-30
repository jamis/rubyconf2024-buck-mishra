fiber = Fiber.new do
  puts 'start'

  Fiber.yield

  puts 'finish'
end

fiber.resume # prints "start"
fiber.resume # prints "finish"
