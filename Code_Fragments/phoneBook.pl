#/usr/bin/perl

use strict;
use warnings;


print<<"EOF";
		Welcome to Phone Book

EOF
print "Press the number:\n";
	
my $exit = 0;

while(1){
	if($exit == 1){
		last;
	}
	print<<"EOF";
	1 - Add a contact 
	2 - Search a contact
	3 - Exit
EOF

	my $path = qx/dirname phoneBook.pl/;
	chomp($path);

	if(!(-e "$path/phoneBook.txt")){
		my @alphabet = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
		my $count = 0;
		open ( my $file_write, ">", "$path/phoneBook.txt" ) or die "Can't open the text file for writing ($!)\n";
		while(<@alphabet>){
			print $file_write $alphabet[$count], "\n";
			$count+=1;
		}
		close($file_write);
		$count = 0;
	}

	open ( my $file_read, "<", "$path/phoneBook.txt" ) or die "Can't open the text file for reading ($!)\n";
	my $choice = <STDIN>;

	if ($choice == 1){ 
		print "Enter the contact name\n";
		my $contact_name = <STDIN>;
		chomp($contact_name);
		$contact_name = uc ($contact_name);
		my @contact_name_array = split //, $contact_name;
		print "Enter the contact number\n";
		my $contact_number = <STDIN>;
		chomp($contact_number);
		my $flag = 0;
		open (my $file_write, ">", "$path/newphoneBook.txt" ) or die "Can't open the text file for writing ($!)\n";
		while(<$file_read>){
			if($flag == 1){
				print $file_write "$contact_name	$contact_number", "\n";
				$.+=1;
			}
			$flag = 0;
			my $letter = $_;
			chomp($letter);
			if($contact_name_array[0] eq $letter){
				$flag = 1;
			}	
			print $file_write $_;
		}
		close($file_write);
		rename("$path/newphoneBook.txt", "$path/phoneBook.txt") or die "Unable to rename: {$!}\n";
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
		print "Please press 1 or 2 \n";
		}


	}		
	elsif($choice == 3){
		print "Exiting\n";
		$exit = 1;
		sleep 1;

	}	

	else {
		print " Please press 1 or 2 \n";
	}
}
