use strict 1.0;
use feature 'class';

class FooClass {
    field $someField = 42;

    method bar {
        say "The answer is $someField";
    }
}

# foo2 comment
sub foo2 () {
    my $foo = Foo.new;
    $foo.bar
}

package person;

sub new ($class, $firstName, $lastName) {
    bless { firstName => $firstName, lastName => $lastName }, $class
}

sub getFirstName($self) {
    $self->{firstName}
}

sub Average {
   # get total number of arguments passed.
   $n = scalar(@_);
   $sum = 0;
   foreach $item (@_) {
      $sum += $item;
   }
   $average = $sum / $n;
   return $average;
}
