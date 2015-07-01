#!/usr/bin/perl

#
#
# Copyright © 1999-2008 SolarWinds, Inc. All Rights Reserved.
#
#

if (@ARGV[0] =~ /\bhelp\b/){
        print "DriveSpace.pl SNMPver community hostname\n";
        print "SNMPver - version of SNMP protocol\n";
        print "community - community name of SNMP protocol\n";
        print "hostname - Taget Host\n";
        exit 1;
}



# Get hostname and trim newline

$localhost = `hostname`;

$localhost =~ s/\s*$//g;

 

 

$hostname  = shift || $localhost;
$community = shift || "public";
$version = shift || "v1";

$preStorageDescr = "HOST-RESOURCES-MIB::hrStorageDescr.";
$outres = "snmpwalk -$version -c $community $hostname HOST-RESOURCES-MIB::hrStorageType | grep hrStorageFixedDisk | cut -d \".\" -f 2 | cut -d \" \" -f 1 |";
#print $outres;
open(OUTDescr,$outres) || die "Unable read pipe\n";
while ($line = <OUTDescr>) {
	#$line = chomp ($line);
	push(@drvdescr, "snmpget -$version -c $community $hostname HOST-RESOURCES-MIB::hrStorageDescr.$line" );
	push(@drvsize, "snmpget -$version -c $community $hostname HOST-RESOURCES-MIB::hrStorageSize.$line" );
	push(@drvused, "snmpget -$version -c $community $hostname HOST-RESOURCES-MIB::hrStorageUsed.$line" );
}
close(OUTDescr);

$total = 0;
foreach $i (@drvsize){
	open (idck,"$i|");
	while($iline=<idck>){
		$indval = index($iline,"=");
		$indval = index($iline,":",$indval); 
		$val = substr($iline,$indval+1,length($iline) - $indval);
		$val =~ s/[a-zA-Z\ ]//g;
		chomp ($val);
		$total = $total + $val;
	}
	close(idck);
}
$totalused = 0;
foreach $i (@drvused){
	open (idck,"$i|");
	while($iline=<idck>){
		$indval = index($iline,"=");
		$indval = index($iline,":",$indval); 
		$val = substr($iline,$indval+1,length($iline) - $indval);
		$val =~ s/[a-zA-Z\ ]//g;
		chomp ($val);
		$totalused = $totalused + $val;
	}
	close(idck);
}
$free = ($total - $totalused) * 100 / $total;
chomp($free);
printf("Message: Available drive space at host \"$hostname\": %.2f in percent \n",$free);
printf ( "Statistic: %.2f\n", $free);
exit 0;