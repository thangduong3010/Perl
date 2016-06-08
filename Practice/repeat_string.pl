#!/usr/bin/perl

print "Enter a string: ";
chomp($str = <STDIN>);
print "How many times do you want to repeat it? ";
chomp($rep = <STDIN>);

print "$str\n" x $rep;