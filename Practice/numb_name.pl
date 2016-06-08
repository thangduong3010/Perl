#!/usr/bin/perl

@list = qw(fred betty barney dino wilma pebbles bamm-bamm);
print "Enter name codes: \n";
chomp(@codes = <STDIN>);

foreach $code (@codes){
	print "$list[$code - 1]\n";
}