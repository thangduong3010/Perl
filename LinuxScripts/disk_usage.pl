#!/usr/bin/perl
@stat=split(" ",`df -Pm | grep "\/\$"`);
$exit=`echo $?`;
if ( $exit == 0 ) {
        print "Message: Available space on / partition in MB : $stat[3]\n";
        print "Statistic: $stat[3]\n";
        exit 0;
        }
print "Message: ERROR: Check the command (df) syntax in script.\n";
exit 1;