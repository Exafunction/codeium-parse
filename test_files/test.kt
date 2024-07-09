package test.kotlin

import kotlinx.coroutines.*
import kotlinx.coroutines.sync.*

/**
 * Class docstring
 *
 * @param param1
 * @param param2
 */
class Foo(param1: Int, param2: Int) {
  /**
   * Constructor docstring
   *
   * @param param1
   * @param param2
   */
  constructor(param1: Int, param2: Int) {}

  /** Method docstring */
  fun methodWithDocstring(): void {}
}

fun fib(n: Int): Int {
  if (n == 0 || n == 1) {
    return n
  }
  return fib(n - 1) + fib(n - 2)
}
