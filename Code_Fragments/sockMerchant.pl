#!/usr/bin/perl
use strict;
use warnings;

sub sockMerchant {

my ( $n, @ar ) = @_;
my $pairCount = 0;

while (1){
	
	if( $n == 0 ){
		last;
	}

	foreach (@ar){
	
	
	}
}


}

open(my $fptr, '>', $ENV{'OUTPUT_PATH'});

my $n = <STDIN>;
$n =~ s/\s+$//;

my $ar = <STDIN>;
$ar =~ s/\s+$//;
my @ar = split /\s+/, $ar;

my $result = sockMerchant $n, \@ar;

printf $fptr "$result\n";

close $fptr;
