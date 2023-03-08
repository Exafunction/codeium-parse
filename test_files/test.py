# fmt: off

from foo import Pattern2a
from foo import pattern2b


class Pattern0:
    """Pattern 0 docstring."""

class Pattern0NoDoc:
    def pattern1(self):
        pass
    """Not a docstring."""

def pattern1(param1):
    # Docstring doesn't come immediately after. Also tests single quotes.
    'Pattern 1 docstring.'

# These cases can't be distinguished.
Pattern2a()
pattern2b(1)
Pattern2a.foo()

# fmt: on
