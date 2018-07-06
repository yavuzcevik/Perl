#!/usr/bin/perl

use strict;
use warnings;

my $string = qx/pwd/;
chomp ($string);
qx/cd $string/;

print << "EOF";
          Welcome to Word Swap
This program aims at swapping words in a text file

Current directory: $string
Please enter the full path of the text file (e.g. /home/user/text.txt)

EOF

my $full_path = <STDIN>;
chomp($full_path);
open ( my $file_read, "<", "$full_path" ) or die " Can't open the text file for reading. ($!)\n";

my $path = qx/dirname $full_path/;
chomp($path);
system("touch $path/output.txt");
open ( my $file_write, "<", "$path/output.txt" ) or die " Can't open the text file for writing. ($!)\n";

print "Enter the word which you want to change\n";
my $old_word = <STDIN>;
chomp($old_word);

print "Enter a new word to replace the old one\n";
my $new_word = <STDIN>;
chomp($new_word);

while (my $line = <$file_read>){
$line =~ s/\s$old_word\s/ $new_word /g;
print $file_write $line;
}
print "\n New text file "output.txt" created in directory $path \n";
