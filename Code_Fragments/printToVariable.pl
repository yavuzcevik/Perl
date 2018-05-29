#!/usr/bin/perl
# Assign a value to a variable with print function
my $output;
open my $file_handler, '>', \$output or die "Can't open the file $!";
print $file_handler "Success!\n";
print $output;

