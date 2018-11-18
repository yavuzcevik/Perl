#!/usr/bin/perl
use strict;
use warnings;

sub sockMerchant {

my ($n, @ar) = @_;
my $pairCount = 0;
my $foundFlag = 0;
my $index = 0;
while (1){
	sleep 1;
	print "n : $n\n";
	$foundFlag = 0;
	$index = 0;
	if( $n == 0){
		last;
	}

	foreach (@ar){
		if ( $foundFlag == 1 ){
			last;
		}	
		print "index $index\n";
		if( $index != 0 && $ar[0] == $_ ){
		# If the pair of the first element is founded
			$foundFlag = 1;
			if( $n == 2 ){
				#If last two elements of the array is a pair
				splice @ar, 0, 2;
				$pairCount++;
				$n-=2;
			}
			else{
				splice @ar, 0, 1;
				splice @ar, $_, 1;
				$pairCount++;
				$n-=2;
			}
		}
	$index++;	
	}
	
	if ( $foundFlag == 0 && $n != 0 ){
		splice @ar, 0, 1;
		$n--;
	}
	
}
print "pair count : $pairCount\n";

}

open(my $fptr, '>', $ENV{'OUTPUT_PATH'});

my $n = <STDIN>;
$n =~ s/\s+$//;

my $ar = <STDIN>;
$ar =~ s/\s+$//;
my @ar = split /\s+/, $ar;
my $result = sockMerchant $n, @ar;

printf $fptr "$result\n";

close $fptr;
