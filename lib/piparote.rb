require 'piparote/version'

module Piparote
  def method_missing(name, *args, &block)
    return Piparote::Object.new(::Object.const_get(name), self) if name[0] =~ /[A-Z]/ && Object.const_defined?(name)
    send(name, self, &block) if respond_to?(name)
  end

  class Object
    def initialize(original, *args)
      @original, @args = original, args
    end

    def method_missing(name, *args, &block)
      @original.send(name, *@args, &block)
    end
  end
end
