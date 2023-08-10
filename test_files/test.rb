require "net/http"

# This is just your standard class
#  nothing strange here
class SomeClass
  # In ruby, the parentheses can be omitted in many circumstances
  # This is probably a job for the AST, but we'll add a test here anyway
  def empty_parens()
    "Nice"
  end
end

module SomeModule
  def omitted_parens
    :foo
  end
end

module Test ; end

# This module is acting more like a namespace
module Test::SubTest
  # We're inheriting from SomeClass here
  class MyClass < SomeClass
    include SomeModule

    # Some languages would call this a "static" method
    def self.in_eigenclass
      new.simple
    end

    class << self
      # In all ways, this method behaves the same as `in_eigenclass`
      def in_reopened_eigenclass
        new.bar(true)
      end
    end

    def simple
      self
    end

    def unparenthesized arg1, arg2
      arg2, arg1 = arg1, arg2
    end

    def optional_param(arg1, arg2 = "fine")
      nil
    end

    def splatted_args(arg1, *args)
    end
  end
end

module Test::SubTest::SubSubTest
  module SubSubSubTest
    extend SomeModule
  end
end

def MyTerribleMethod
end

MyTerribleMethod()
