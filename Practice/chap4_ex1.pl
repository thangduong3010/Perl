#!/usr/bin/perl

use strict;
use warnings;

sub total{
	my $total = 0;

	foreach (@_){
		$total += $_;
	}

	return $total;
}

my @fred = qw(1 2 3 4 5);
my $fred_total = &total(@fred);
print "Fred total: $fred_total\n";

print "Enter some numbers on seperate line:\n";
my $user_total = total(<STDIN>);
print "Your total: $user_total\n";

print "Mass total: ", total(1..1000), "\n";