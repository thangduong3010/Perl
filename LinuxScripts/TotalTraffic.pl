#!/usr/bin/perl

#
#
# Copyright © 1999-2008 SolarWinds, Inc. All Rights Reserved.
#
#

if (@ARGV[0] =~ /\bhelp\b/)
{
        print "TotalTraffic.pl SNMPver community hostname\n";
        print "SNMPver - version of SNMP protocol\n";
        print "community - community name of SNMP protocol\n";
        print "hostname - Target host\n";
        exit 1;
}

# Get hostname and trim newline

$localhost = `hostname`;

$localhost =~ s/\s*$//g;

 

 

$hostname  = shift || $localhost;
$community = shift || "public";
$version = shift || "v1";

$results =  "";
$MIB_TotalTraffic= "APACHE2-MIB::totalTraffic.0";
$outres = "snmpget -$version -c $community $hostname $MIB_TotalTraffic |";
open(OUTSTD,$outres) || die "Unable read pipe\n";
while ($line = <OUTSTD>) {
	     $indval = index($line,"="); 
	     $indval = index($line,":",$indval); 
	     $val = substr($line,$indval+1,length($line) - $indval);
	     $val =~ s/[a-zA-Z\/\n ]//g;
	     print "Message: Total traffic at host \"$hostname\": $val\n";
	     print "Statistic: $val\n";
	     exit 0;
}
print "Statistic: 0\n";
exit 1;
