#!/usr/bin/perl
use strict;
use warnings;

sub forward{
	my($par1) = @_;
	print "You gave me $par1\n";
	print "I will try forward reference in perl\n";
	&marine;
}

sub marine{
	my $n += 1; # local var
	print "Hello, sailor number #$n!\n";
}

sub max{
	my $max_so_far = shift @_;

	foreach (@_){
		if($_ > $max_so_far){
			$max_so_far = $_;
		}		
	}
	return $max_so_far;
}


&forward(1000);
my $maximum = &max(3, 5, 4, 102, 96);
print "Maximum: $maximum\n";

<STDIN>;





