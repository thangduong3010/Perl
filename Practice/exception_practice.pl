#!/usr/bin/perl

use strict;
use warnings;

print "Hey you! Enter a number: ";
chomp(my $num = <STDIN>);

unless ($num =~ /\d/) {
	# body...
	die "I told you I need a number! You freak!\n";
}

print "Hi there!\n";

=this would be rewritten like below
unless ($num =~ /[0-9]/) {
	# body...
	die "I told you I need a number! You freak!\n";
}
=cut