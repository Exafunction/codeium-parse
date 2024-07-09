import 'package:test/test.dart';

// Functions

// foo not a docstring
void foo() {
    print("Hello, World!");
}

/// bar is a docstring
int bar() {
    return 0;
}

// Classes with methods

class FooClass {
    int someField = 0;

    // Constructor
    FooClass() {
        this.someField = 0;
    }

    /// FCB docstring
    int fooClassBar() {
        return 0;
    }
}

// Mixins
mixin FooMixin {
    int barMixin() {
        return 0;
    }
}

// Combinations
class FooBar extends FooClass with Foo {
    int bar() {
        return 0;
    }
}

void main() {
    print("Hello, World!");
}
