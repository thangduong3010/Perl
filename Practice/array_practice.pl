#!/usr/bin/perl

use strict;
use warnings;

# populate an array
my @coins = qw(Quarter Dime Nickel);
print "1. \@coins = @coins\n";

# add one element at the end
push @coins, "Penny";
print "2. \@coins = @coins\n";

# add one element at the beginning
unshift @coins, "Dollar";
print "3. \@coins = @coins\n";

# remove one element from the end
pop @coins;
print "4. \@coins = @coins\n";

# remove one element from the beginning
shift @coins;
print "5. \@coins = @coins\n";

# slice array
my @days = qw(Mon Tue Wed Thu Fri Sat Sun);
print "@days[3,4,5]\n";

# replace array's elements
my @nums = (1..20);
print "Before: @nums\n";

splice @nums, 5, 3, 21..23;
print "After: @nums\n";

# transform strings to arrays
my $var_string = "Rain-Drops-On-Roses-And-Whiskers-On-Kittens";
my $var_names = "Larry,David,Roger,Mike";

my @string = split "-", $var_string;
print "String: $string[1]\n";

my @name = split ",", $var_names;
print "Name: $name[1]\n";

# transform arrays to strings
my $new_string = "Rain-Drops-On-Roses-And-Whiskers-On-Kittens";
my @string = split "-", $var_string;
my $string1 = join ",", @string;

print "String: $string1\n";