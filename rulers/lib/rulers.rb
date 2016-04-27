require "rulers/version"
require "rulers/array"
require "rulers/routing"

module Rulers
  class Application
    # `echo debug > debug.txt`
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, {'Content-Type' => 'text/html'},
      [text]]
      puts "Sum an array: #{[2, 4, 6].sum}"
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
