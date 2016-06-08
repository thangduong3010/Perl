#!/usr/bin/perl

$pi = 3.14;

print "Enter the radius: ";
chomp($rad = <STDIN>);

if($rad < 0) {
  print "Circumference: 0\n";
}
else {
  $cir = 2 * $pi * $rad;
  print "Circumference: $cir\n";
}