#!/usr/bin/perl

use strict;
use warnings;


sub average{
	my @count = @_;
	my $total = 0;

	if (@_ == 0){
		return;
	}

	foreach (@_){
		$total += $_;
	}

	return $total / ($#count + 1);
}

sub above_avg{
	my $p_avg = &average(@_);
	my @result = ();

	foreach (@_){
		if ($_ > $p_avg){
			push @result, $_;
		}
	}
	return @result;
}

print "Average: ", &average(1..10), "\n";
my @yay = &above_avg(1..10);
print "Above: @yay\n";

print "Barney: ", &above_avg(100, 1..10), "\n";
