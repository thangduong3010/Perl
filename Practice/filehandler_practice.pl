#!/usr/bin/perl

use strict;
use warnings;

my $filename = 'abc.txt';

# open to read
open(my $fh, '<', $filename) or die "Couldn't open file $filename. $!";

while (my $line = <$fh>){
	chomp $line;

	if ($line eq 'ghi'){
		print "Ahihi. I saw you!\n";
	}
	else{
		print "$line\n";
	}
}
# close file
close $fh;


# open to write
open(my $handler, '>', $filename) or die "Couldn't open file $filename. $!";

print $handler "Now this will be a longer line\n";
close $handler;

=cmt
# append to file
open(DATA, ">>abc.txt") or die "Coudn't open file, $!";

close(DATA);


# open to read
open(DATA, "<abc.txt") or die "Coudn't open file, $!";

while (defined ($_ = <DATA>)){
	print "$_\n";
}
# close file
close(DATA);
=cut