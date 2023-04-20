#include <string>

namespace bar {
// Declaration.
bool baz(const std::string& bing);

struct Foo2;

}  // namespace bar

namespace bar::bar2 {
struct Foo3;
}

class Foo {
 public:
  // foo
  // foo2
  void foo() {
    // Do nothing.
  }
};

struct bar::Foo2 {};
struct bar::bar2::Foo3 {};

// baz
bool bar::baz(const std::string& bing) { return bing.empty(); }
