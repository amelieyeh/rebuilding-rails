require "rulers/version"
require "rulers/array"

module Rulers
  class Application
    # `echo debug > debug.txt`
    def call(env)
      [200, {'Content-Type' => 'text/html'},
      ["Hello from Ruby on Rulers!"]]
      puts "Sum an array: #{[2, 4, 6].sum}"
    end
  end
end
