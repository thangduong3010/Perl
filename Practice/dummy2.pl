#!/usr/bin/perl

use strict; #uncomment me later!
use warnings;
use 5.010;



sub which_element_is{
	my ($what, @array) = @_;

	foreach (0..$#array){
		if ($what eq $array[$_]){
			return $_;
		}
	}
	-1;
}

sub marine{
	state $n = 1;
	print "n: $n\n";
}

my @names = qw(fred barney betty dino wilma pebbles);
my $result = &which_element_is("dino", @names);
print "The fucking result is: $result\n";

my $d1 = 2;
my $d2 = 3.0;
printf("%.1f\n", $d1 + $d2);

&marine;
my @l = qw(1 2 3 4);
print "Elements in l: " . ($#l + 1) . "\n";
