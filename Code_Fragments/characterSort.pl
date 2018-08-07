#!/usr/bin/perl
#Created by Halil Yavuz Çevik (20.07.2018)

use strict;
use warnings;

my @alphabet = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
my @alphabet_random = ('A','D','N','B','E','F','G','Q','I','J','K','L','M','C','T','P','H','R','S','O','U','V','W','X','Z','Y');
my $count = 0;
print "Before Sorting: @alphabet_random\n";
my $count_first;
my $count_second;
my $first_loop_iteration_number = 0;
foreach (@alphabet_random){
	$count+=1;
}

while(1){
	$count_first = 0;
	$count_second = 0;
	foreach my $second_loop_iteration_number (0..$count){
      		if ($alphabet_random[$first_loop_iteration_number] eq $alphabet[$second_loop_iteration_number]){
       			$count_first = $second_loop_iteration_number;
      		}
      		if ($alphabet_random[$first_loop_iteration_number+1] eq $alphabet[$second_loop_iteration_number]){
       			$count_second = $second_loop_iteration_number;
      		}	
	}
	if ($count_first > $count_second){
		($alphabet_random[$first_loop_iteration_number],$alphabet_random[$first_loop_iteration_number+1]) = ($alphabet_random[$first_loop_iteration_number+1],$alphabet_random[$first_loop_iteration_number]);
  	}
	print "$first_loop_iteration_number. iteration : @alphabet_random\n";
	qx/sleep 1/;
	if ($first_loop_iteration_number == $count){
		$first_loop_iteration_number = 0;
	}
	else{
		$first_loop_iteration_number++;
	}
}

print "After Sorting: @alphabet_random\n";
