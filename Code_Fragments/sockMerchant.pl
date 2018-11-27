#!/usr/bin/perl
use strict;
use warnings;

sub sockMerchant {

my ($n, @ar) = @_;
#pairCount: The number of pair of socks in the given array.
my @ar = @{$_[1]};
my $pairCount = 0;
my $foundFlag = 0;
my $index = 0;
while (1){
	$foundFlag = 0;
	$index = 0;
	if( $n == 0){
		last;
	}

	foreach (@ar){
		if ( $foundFlag == 1 ){
		#If a pair is founded, algorithm will start to search once again from beginnig.
		#So, a break will be implemented after a pair is founded.
			last;
		}	
		if( $index != 0 && $ar[0] == $_ ){
		# A pair is founded.
			$foundFlag = 1;
			if( $n == 2 ){
				#If last two elements of the array is a pair
				splice @ar, 0, 2;
				$pairCount++;
				$n-=2;
			}
			else{
				splice @ar, $index, 1;
				splice @ar, 0, 1;
				$pairCount++;
				$n-=2;
			}
		}
	$index++;	
	}
	
	if ( $foundFlag == 0 && $n != 0 ){
	# If the chosen element has no pair, it'll be eleminated.
		splice @ar, 0, 1;
		$n--;
	}
}

return $pairCount;	
}

print "Please Enter Socks Count \n"
my $n = <STDIN>;
$n =~ s/\s+$//;

print "Please Enter Color Codes of the Socks \n"
print "Example: 10 20 30 30 20 30 60 10 80 \n"
my $ar = <STDIN>;
$ar =~ s/\s+$//;
my @ar = split /\s+/, $ar;

my $result = sockMerchant $n, \@ar;

print "Available pairs for sell : $result\n";
