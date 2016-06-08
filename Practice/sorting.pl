#!/usr/bin/perl

print "Enter names: \n";
chomp(@names = <STDIN>);
@names = sort @names;

foreach $name (@names){
	print "$name\n";
}