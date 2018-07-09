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
open ( my $file_write, ">", "$path/phoneBook.txt" ) or die "Can't open the text file for writing ($!)\n";
open ( my $file_read, "<", "$path/phoneBook.txt" ) or die "Can't open the text file for reading ($!)\n";

while(<@alphabet>){
print $file_write "---------- $alphabet[$count] ----------", "\n";
$count+=1;
};

my $choice = <STDIN>;

if ($choice == 1){ 
	print "Enter the contact name\n";
}

elsif($choice == 2){
	print<<"EOF";
Press the number:
	
	1 - Search by name 
	2 - Search by number

EOF
	my $search_choice = <STDIN>;
	chomp($search_choice);

	if($search_choice == 1){
	}

	elsif($search_choice ==2){
	}

	else {
	print " Please press 1 or 2 \n";
	}


}

else {
print " Please press 1 or 2 \n";
}

