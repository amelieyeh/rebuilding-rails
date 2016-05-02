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
      
      if env['PATH_INFO'] == '/'
        return [200, {'Content-Type' => 'text/html'}, ["Hello!"]]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, {'Content-Type' => 'text/html'},
      [text]]
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
