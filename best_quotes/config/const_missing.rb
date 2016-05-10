class Object
  def self.const_missing(c)
    require "./config/bobo"
    # require "./config/#{c}"
    Object.const_get(c, Object)
    Bobo
  end
end

Bobo.new.print_bobo
