#!/usr/bin/perl

use strict;
use warnings;

my @alphabet = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
my @alphabet_random = ('A','D','N','B','E','F','G','Q','I','J','K','L','M','C','T','P','H','R','S','O','U','V','W','X','Z','Y');
my $count = 0;
print "Before Sorting: @alphabet_random\n";
my $var_random;
my $var;
my $count_first;
my $count_second;

foreach $var_random (@alphabet_random){
  foreach $var (@alphabet){
      $count+=1;
      if ($var_random eq $var){
        $count_first = $count;
      }
      if ($var_random+1 eq $var){
        $count_second = $count;
      }
  if ($count_first > $count_second){
    ($var_random, $var_random+1) = ($var_random+1, $var_random);
  }
}

print "After Sorting: @alphabet_random\n";
