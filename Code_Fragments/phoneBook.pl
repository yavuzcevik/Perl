#/usr/bin/perl

use strict;
use warnings;


print<<"EOF";
		Welcome to Phone Book

Press the number:
	
	1 - Add a contact 
	2 - Search a contact

EOF

my $path = qx/dirname phoneBook.pl/;
chomp($path);
system("touch $path/phoneBook.txt");
system("chmod 666 $path/phoneBook.txt");
my @alphabet = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
my $count = 0;
open ( $file_write, ">", "$path/phoneBook.txt" ) or "Can't open the text file for writing ($!)\n";

while(<@alphabet>){
print $file_write "---------- $alphabet[$count] ----------", "\n";
$count+=1;
}

my $choice = <STDIN>;

if ($choice == 1){ 
}

elsif($choice == 2){
}

else {
}

