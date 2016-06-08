#!/usr/bin/perl

print "Enter a string: \n";
chomp(@string = <STDIN>);
print "Here it is: @string\n";
@string = reverse @string;

print "Reverse: \n";
foreach $i (@string){
	print "$i\n";
}