#!/usr/bin/perl

print "Enter the first number: ";
chomp($n1 = <STDIN>);
print "Enter the second number: ";
chomp($n2 = <STDIN>);

$mul = $n1 * $n2;
print "$n1 * $n2 = $mul\n";