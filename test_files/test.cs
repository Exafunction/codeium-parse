// clang-format off
namespace Namespace {
  // Comment A.
  internal delegate void A(params int[] test);
  // Comment F.
  public struct F<T>
      where T : struct {
  }
  // Comment F.
  [Nice]
  private record F<T1, T2>
      where T1 : I1, I2, new()
      where T2 : I2 {}
  // Comment Teacher.
  record Teacher(string FirstName, string LastName, string Subject) : Person(FirstName, LastName);
  // Comment B.
  enum B { Ten = 10, Twenty = 20 }
  // Comment F.
  public class F : object, IAlpha, IOmega {}
  // Comment Class.
  public partial class Class<in TParam>
      where TParam : class ?, notnull, F ? {
    // Comment operator +.
    public static int operator +(A a) {
      return 0;
    }
    // Comment GetSet.
    uint GetSet { get; set; }
    // Comment Foo.
    static extern Foo() => bar = 0;
    // Comment ~Class.
    extern ~Class() {}
    // Comment Bar
    public void Bar() => bar = 0;
  }
  // Comment IFoo.
  public interface IFoo {}
}
// clang-format on
