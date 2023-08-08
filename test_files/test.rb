require "net/http"

class SomeClass
  def nice()
    "Nice"
  end
end

module Foo
  def foo
    :foo
  end
end

module Test::SubTest
  class MyClass < SomeClass
    include Foo

    def self.foo
      new.foo
    end

    class << self
      def bar
        new.bar(true)
      end
    end

    def foo
      self
    end

    def bar(arg1, arg2 = "fine")
      nil
    end

    def baz(arg1, *args)
    end
  end
end

module Test::SubTest::SubSubTest
  module SubSubSubTest
    extend Foo
  end
end
