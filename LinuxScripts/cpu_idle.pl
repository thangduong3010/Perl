#!/usr/bin/perl
@sa=split("\n",`vmstat`);
@line=split(" ",$sa[1]);
for ($i=0; $i <= @line; $i++) {
        if ( $line[$i] eq "id" ) {
                $j=$i;
                @stat=split(" ",$sa[2]);
                print "Message: CPU idle time in percentage: $stat[$j]\n";
                print "Statistic: $stat[$j]\n";
                exit 0;
                }
        }
print "Message: ERROR: Can't find CPU idle time (id) in output of -vmstat- command. \n";
exit 1;