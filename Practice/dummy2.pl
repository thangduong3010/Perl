#!/usr/bin/perl

#use strict; #uncomment me later!
#use warnings;



sub which_element_is{
	my ($what, @array) = @_;

	foreach (0..$#array){
		if ($what eq $array[$_]){
			return $_;
		}
	}
	-1;
}

my @names = qw(fred barney betty dino wilma pebbles);
my $result = &which_element_is("dino", @names);
print "The fucking result is: $result\n";

$d1 = 2;
$d2 = 3.0;
printf("%.1f\n", $d1 + $d2);