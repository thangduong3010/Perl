#!/usr/bin/perl

use strict;
use warnings;

=cmt
print "Enter something: \n";

while (defined($_ = <STDIN>)) {
	print "I saw: $_\n";
}

print "Try another: \n";

foreach(<STDIN>){
	print "I saw this: $_\n";
}

print "One more: \n";

while (<STDIN>) {
	print "Now this: $_\n";
}

$a = 10;
$var = <<'EOF';
This will be a very long document
...
,,

////
dsdsdsdsdsd
a = $a;
EOF

print $var;
=cut

while (defined($_ = <>)){
	chomp($_);
	print "I saw: $_\n";
}

my %data = ('John', 45, 'Lisa', 30, 'Kumar', 40);
my %numb = (1, 'One', 2, 'Two', 3, 'Three');

print "John: $data{'John'}\n";
print "Lisa: $data{'Lisa'}\n";
print "Kumar: $data{'Kumar'}\n";

print "1: $numb{1}\n";
print "2: $numb{2}\n";
print "3: $numb{3}\n";


my @array = qw(1 2 3 10);
print "Array: ", scalar @array, "\n";