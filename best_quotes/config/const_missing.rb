class Object
  def self.const_missing(c)
    require "./config/#{c}"
    Object.const_get(c, Object)
  end
end

Bobo.new.print_bobo
