#!/usr/bin/perl

use strict;
use warnings;

=cmt
my $scalarref = \$foo;
my $arrayref = \@array;
my $hashref = \%hash;
my $coderef = \&handler;
my $globref = \*foo;

# reference to anonymous array
my $arrayref = [1, 2, ['a', 'b', 'c']];

# reference to anonymous hash
my $hashref = {'Adam' => 'Eve', 'Clyde' => 'Bonnie'};

# reference to anonymous subroutine
my $coderef = sub { print "Bing!\n" };

=cut

# dereferencing
my $var = 10;
my $r = \$var; # $r has reference to $var

print "Location of \$var is: $r\n";
print "Value of \$var is: ", $$r, "\n";

my @array = (1, 2, 3);
my $rr = \@array;

print "Location of array is: $rr\n";
print "Value of array is: ", @$rr, "\n";
