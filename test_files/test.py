# fmt: off

from foo import decorated1
from foo import decorated2
from foo import Pattern2a
from foo import pattern2b


class Pattern0:
    """Pattern 0 docstring."""
    def __init__(self):
        pass

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

@decorated1
@decorated2
class DecoratedClass:
    """Decorated class docstring."""
    @decorated1
    @decorated2
    def decorated_method(self):
        """Decorated method docstring."""

@decorated1
@decorated2
def decorated_function():
    """Decorated function docstring."""

# fmt: on
