#!/usr/bin/perl

use strict;
use warnings;

my $name = "Ali";
my $age = 10;
my $status = ($age > 60) ? "A senior citizen" : "Not a senior citizen";

print "Ali is $status\n";


my $a = 20;

unless ($a < 20) {
	# if the condition is false, then execute the following
	print "a is greater than 20\n";
}

my $b = "";

unless ($b) {
	# body...
	print "b has a false value\n";
}