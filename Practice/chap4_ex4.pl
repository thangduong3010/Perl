#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

sub greet{
	my $name = shift;
	state @names;

	print "Hi $name! ";

	if (@names){
		print "I've seen: @names\n";
	}
	else{
		print "You are the first one here!\n";
	}
	push @names, $name;
}

&greet("Fred");
&greet("Barney");
&greet("John");
&greet("Emma");