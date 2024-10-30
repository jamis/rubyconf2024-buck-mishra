fiber = Fiber.new { puts 'Dare we hope?' }

fiber.resume # prints "Dare we hope?"
