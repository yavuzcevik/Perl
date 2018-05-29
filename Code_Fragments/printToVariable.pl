#!/usr/bin/perl
# The code can assign given value of "file_handler" parameter to the "output" parameter
my $output;
open my $file_handler, '>', \$output or die "Can't open the file $!";
print $file_handler "Success!\n";
print $output;
