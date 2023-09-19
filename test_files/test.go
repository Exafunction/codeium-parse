package test_files

// Pattern 0.
type Pattern0 struct {
	a string
}

// Pattern 1.
type Pattern1 interface {
	// Hi
	a() string
}

// Unsupported.
type (
	UnsupportedStruct    struct{}
	UnsupportedInterface interface{}
)

func Pattern2() {}

// Comments
// here.
func (p *Pattern0) Method(string) {}

func (p Pattern0) Method2(a string) string {
	Pattern2()
	s := &Pattern0{a: "foo"}
	s.Method("")
	((*Pattern0)(s)).Method("")
	var s2 any
	s2.(*Pattern0).Method("")
	return a
}

type Alias string
