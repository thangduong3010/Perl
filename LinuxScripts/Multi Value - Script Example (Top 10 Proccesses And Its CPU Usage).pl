#!/usr/bin/perl
#    Show top 10 processes sorted by CPU usage. 
$test=`ps axo pcpu,comm 2>&1 > /dev/null`;
$exit=`echo $?`;
if ($exit != 0) {
  print "Message.0: ps: wrong syntax.\n";
  exit 1;
  }
@sa=split("\n",`ps axo pcpu,comm --sort -pcpu | head -11 | tail -10`);
for ($i=0; $i < @sa; $i++) {
  @stat=split(" ",$sa[$i]);
  print "Message.$i: $stat[1]\n";
  print "Statistic.$i: $stat[0]\n";
  }
exit 0;