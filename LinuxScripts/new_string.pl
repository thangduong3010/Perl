#!/usr/bin/perl
# arguments: perl ${SCRIPT} "/etc/inittab" "init"

use File::Basename;
$lp=$ARGV[0];
$regex=$ARGV[1];
$er_mes="Message: Check arguments: \"logfile_path\" \"regex\".";
$ws="Statistic:";
$wm="Message:";
$name = basename $lp;
sub chk_var
{
if ($_[0] eq '')
{
print "$er_mes\n";
exit 1;
}
}
sub out_res
{
print "Statistic: $_[0]\n";
print "Message: $_[1]\n";
exit 0;
}
chk_var($lp);
chk_var($regex);
unless (-e $lp)
{
print "$wm File $lp not found.\n";
exit 1;
}
$search=$regex;
$search=~ s/[^a-zA-Z0-9]*//g;
$fp='/tmp/new'.'_'.${name}.'_'.${search};
if (-e "$fp")
{
open (TF, $fp);
while (<TF>)
{
chomp;
$kr=$_;
}
close (TF);
}
else
{
$kr=0;
}
open (LF, $lp);
my @lf = <LF>;
close (LF);
$i=0;
$pos=1;
$t=0;
foreach $l (@lf)
{
chomp $l;
if ($l =~ /$regex/)
{
$resl[$i]=$l;
$resn[$i]=$pos;
$i++;
$t++;
}
$pos++;
}
if ($t lt $kr)
{
$kr=0;
}
$temp=$t-$kr;
$kr=$temp+$kr;
open (TF, ">$fp");
print TF "$kr\n";
close TF;
$length=@resl;
$limit=$length-1-$temp;
if ($temp ne 0)
{
for ($i=$length-1;$i>$limit;$i--)
{
$l=$resl[$i];
$str.="<br/>";
$str.=$l;
$str.=";";
}
print "$ws $temp\n";
print "$wm Number of newly found string: $temp\n";
exit 0;
}
else
{
print "$ws $temp\n";
print "$wm No new strings found.\n";
exit 0;
}
