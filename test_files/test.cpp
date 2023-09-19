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
  // Constructor comment.
  Foo() = default;
  // Constructor comment.
  explicit Foo(int /*unused*/) {}
  // foo
  // foo2
  void foo() {
    // Do nothing.
  }
};

struct bar::Foo2 {};
struct bar::bar2::Foo3 {};

// baz
bool bar::baz(const std::string& bing) {
  // This shouldn't be recognized as a function.
  Foo dist();
  return bing.empty();
}

// one_pointer comment
bool* one_pointer() { return nullptr; }
// two_pointer comment
bool** two_pointer() { return nullptr; }

// Comment.
template <typename T>
class TemplatedFoo {
  template <typename U>
  void foo();
};

// Comment.
template <typename T>
template <typename U>
void TemplatedFoo<T>::foo() {}

// Comment.
template <>
template <>
void TemplatedFoo<int>::foo<int>() {}

// Comment.
template <typename T>
class TemplatedFoo2;

// Comment.
template <>
class TemplatedFoo2<int> {};
