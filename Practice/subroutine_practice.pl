#!/usr/bin/perl

use strict;
use warnings;


sub hello{
	print "Hello, @_\n";
}

sub average{
	my $n = scalar @_;
	my $sum = 0;

	foreach (@_){
		$sum += $_;
	}

	print "Average for given number: ", $sum / $n, "\n";
}

sub printHash{
	my (%hash) = @_;

	foreach my $key (keys %hash){
		my $value = $hash{$key};
		print "$key: $value\n";
	}
}

my $string = "Hello, World";

sub printHello{
	local $nah;
	$nah = "Hi Perl";

	print "Inside function: $nah\n";
}

printHello();
print "Outside function: $string\n";