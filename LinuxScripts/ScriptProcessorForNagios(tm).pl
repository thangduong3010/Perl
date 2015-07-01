#!/usr/bin/perl

#
#
# Copyright © 1999-2008 SolarWinds, Inc. All Rights Reserved.
#
#

use strict;
$" = "\n";
my $command = join( ' ', @ARGV );
my $output = `$command`;
my $exit = $?>>8;
$output =~ m/([^(\||\n)]*)/;
my $small_output = $1;
my @long_output = $output =~ m/(\n[^(\||\n)]*)/g;
$output = "$small_output @long_output";
$output =~ s/\s*$//g;
$output =~ s/\n/<br\/>/g;
print "Message: $output\n";
print "Statistic: 0\n";
if ($exit == 0){ exit 0; } elsif (!$output){exit 1;} else { exit ++$exit; }