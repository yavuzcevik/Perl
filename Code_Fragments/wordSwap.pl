#!/usr/bin/perl

use strict;
use warnings;

print "Enter the word which you want to change\n";
my $old_word = <STDIN>;
chomp($old_word);

print "Enter a new word to replace the old one\n";
my $new_word = <STDIN>;
chomp($new_word);
