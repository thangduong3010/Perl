#!/usr/bin/perl

@shows = ("All about Anroid", "Before you Buy", "Heil Hydra", "Coding 101");

$network = "TWIT";
# these two are different
$NetWork = "Yoyoyo";
$NETWORK = "Sup?";

$selected = 3;

print "Subsribe to $shows[$selected]. a fine $network show!\n";
# alternative way to print
print "Subsribe to " . $shows[$selected] . ". a fine " . $network . " show!\n";

=cmt
print <<EOF;
Subcribe to "$shows[$selected]" . a fine $network show!

What is going on down here?

:)
EOF;
=cut

