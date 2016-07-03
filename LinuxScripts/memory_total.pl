#!/usr/bin/perl
@stat=split(" ",`free -k | grep "Mem"`);
$exit=`echo $?`;
if ( $exit == 0 ) {
        print "Message: Total amount of memory in kB: $stat[1]\n";
        print "Statistic: $stat[1]\n";
        exit 0;
        }
print "Message: ERROR: Can't find memory field (Mem) in (free -k) command. \n";
exit 1;