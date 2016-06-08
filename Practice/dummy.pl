#!/usr/bin/perl

sub forward{
	print "I will try forward reference in perl\n";
	&marine;
}

sub marine{
	my $n += 1; # local var
	print "Hello, sailor number #$n!\n";
}

sub nothing{
	print "$_[0]\n";
	print "$_[1]\n";
}

sub max{
	my($max_so_far) = shift @_;

	foreach (@_){
		if($_ > $max_so_far){
			$max_so_far = $_;
		}		
	}
	return $max_so_far;
}

&forward;
&marine;
&marine;
&nothing(1, 3445);
@nothing = ();
$maximum = &max(3, 5, 4, 102, 96);
print "Maximum: $maximum\n";
$maximum = &max(@nothing);
print "Max of empty: $maximum\n";

