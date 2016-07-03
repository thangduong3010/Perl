#!/usr/bin/perl

use strict;
use warnings;

my %data = ("John Paul" => 45, "Lisa" => 30, "Kumar" => 35);

print "John Paul: ", $data{"John Paul"}, "\n";

# extracting slice
my @array = @data{"John Paul", "Lisa"};
print "Array: @array\n";

# extracting keys
my @names = keys %data;

print "Names: @names\n";

# extracting values
my @ages = values %data;

print "Ages: @ages\n";

# checking for existence
if (exists($data{"Howard"})){
	print "Lisa is ", $data{"Lisa"}, " years old\n";
}
else {
	print "I don't know!\n";
}

my $size = values %data;
print "Size hash: $size\n";

# adding element
$data{"Howard"} = 55;

my $size = values %data;
print "Size hash: $size\n";

# deleting element
delete $data{"Howard"};

my $size = values %data;
print "Size hash: $size\n";