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

my $choice = <STDIN>;

if ($choice == 1){ 
}

elsif($choice == 2){
}

else {
}

