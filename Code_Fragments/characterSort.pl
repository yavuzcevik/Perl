#!/usr/bin/perl
#Created by Halil Yavuz Çevik (20.07.2018)
# This script sorts given alphabet which is not in order.
use strict;
use warnings;

my @alphabet = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
my @alphabet_random = ('A','D','N','B','E','F','G','Q','I','J','K','L','M','C','T','P','H','R','S','O','U','V','W','X','Z','Y');
# Creating "count" variable to hold the number of characters in alphabets
my $count = 0;
print "Before Sorting: @alphabet_random\n";
# Creating "count_first" and "count_second" variables to search sorted alphabet indexes of two consecutive elements of unsorted alphabet.
my $count_first;
my $count_second;
# Creating "count_loop_break" variable to exit from while loop once it finishes to sort.
my $count_loop_break;
# Creating "first_loop_iteration_number" variable to hold unsorted alphabet indexes of two consecutive elements
my $first_loop_iteration_number = 0;
# Finding the number of characters in unsorted alphabet (number of characters of two arrays are equal)
foreach (@alphabet_random){
	$count+=1;
}

# Starting to sort using Bubble Sort
while(1){
	$count_first = 0;
	$count_second = 0;
	# Using second loop for obtaining sorted index information of unsorted elements
	# and assigning them to count variables.
	foreach my $second_loop_iteration_number (0..$count){
      		if ($alphabet_random[$first_loop_iteration_number] eq $alphabet[$second_loop_iteration_number]){
       			$count_first = $second_loop_iteration_number;
      		}
      		if ($alphabet_random[$first_loop_iteration_number+1] eq $alphabet[$second_loop_iteration_number]){
       			$count_second = $second_loop_iteration_number;
      		}	
	}
	# Sorting phase
	if ($count_first > $count_second){
		($alphabet_random[$first_loop_iteration_number],$alphabet_random[$first_loop_iteration_number+1]) = ($alphabet_random[$first_loop_iteration_number+1],$alphabet_random[$first_loop_iteration_number]);
  	}
	print "$first_loop_iteration_number. iteration : @alphabet_random\n";
	qx/sleep 1/;
	# In each iteration of while, script cheks if sorting is complate. 
	if ($first_loop_iteration_number == $count){
		if($count_loop_break == 0){
			last;
		}
		else{
			$first_loop_iteration_number = 0;
			$count_loop_break = 0;
		}
	}
	$first_loop_iteration_number++;
}

print "After Sorting: @alphabet_random\n";
