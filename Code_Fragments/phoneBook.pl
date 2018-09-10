#!/usr/bin/perl

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
	1 - Show Phone Book
	2 - Add a Contact
	3 - Delete a Contact 
	4 - Search a Contact
	5 - Exit
EOF

	my $path_tmp = qx/find . | grep phoneBook.pl/;
	my $path = qx/dirname $path_tmp/;
	chomp($path);

	if(!(-e "$path/phoneBook.txt")){
		my @alphabet = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
		my @phonebook_sorting_array = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
		my $count = 0;
		open ( my $file_write, ">", "$path/phoneBook.txt" ) or die "Can't open the text file for writing ($!)\n";
		while(<@alphabet>){
			print $file_write $alphabet[$count], "\n";
			$count+=1;
		}
		close($file_write);
		$count = 0;
	}

	
	my $choice = <STDIN>;

	if ($choice == 2){ 
		#Add a Contact
		open ( my $file_read, "<", "$path/phoneBook.txt" ) or die "Can't open the text file for reading ($!)\n";
		print "Enter the contact name\n";
		my $contact_name = <STDIN>;
		chomp($contact_name);
		$contact_name = uc ($contact_name);
		my @contact_name_array = split //, $contact_name;
#----------------------------------------------------------------------------------------------------------------------------
		#SORTING PART
		my $given_contact_name_length = 0;
		my $phonebook_sorting_array_length = 0;
		#Finding the length of the contact name which is given. We'll use it in the comparaison between
		#given contact name and a certain name from phonebook sorting array.
		foreach (@contact_name_array){
			$given_contact_name_length += 1;
		}
		while (1){
		
		}
#----------------------------------------------------------------------------------------------------------------------------
		print "Enter the contact number\n";
		my $contact_number = <STDIN>;
		chomp($contact_number);
		my $flag = 0;
		open (my $file_write, ">", "$path/newphoneBook.txt" ) or die "Can't open the text file for writing ($!)\n";
		while(<$file_read>){
			if($flag == 1){
				print $file_write "$contact_name\t$contact_number", "\n";
				$.+=1;
			}
			$flag = 0;
			my $letter = $_;
			chomp($letter);
			if(defined $contact_name_array[0] && $contact_name_array[0] eq $letter){
				$flag = 1;
			}	
			print $file_write $_;
		}
		close($file_write);
		close($file_read);
		rename("$path/newphoneBook.txt", "$path/phoneBook.txt") or die "Unable to rename: {$!}\n";
	}
	elsif($choice == 4){
		#Search a Contact
		print<<"EOF";
Press the number:
	
	1 - Search by name 
	2 - Search by number

EOF
		my $search_choice = <STDIN>;
		chomp($search_choice);
		my @element_array;

		if($search_choice == 1){
			open ( my $file_read, "<", "$path/phoneBook.txt" ) or die "Can't open the text file for reading ($!)\n";
			print "Please enter the name\n";
			my $search_name = <STDIN>;
			chomp($search_name);
			$search_name = uc $search_name;	
			while(<$file_read>){
				@element_array = split /\t/, $file_read;		
				if (defined $element_array[0] && $element_array[0] eq $search_name){
					print "Name: $element_array[0]\nPhone Number:$element_array[1]\n";
				}
			}	
			close($file_read);	
		}

		elsif($search_choice == 2){
			open ( my $file_read, "<", "$path/phoneBook.txt" ) or die "Can't open the text file for reading ($!)\n";
			print "Please enter the number\n";
			my $search_number = <STDIN>;
			while(<$file_read>){
				@element_array = split /\t/, $file_read;	
				if (defined $element_array[1] && $element_array[1] == $search_number){
					print "Name: $element_array[0]\nPhone Number:$element_array[1]\n";
				}
			}	
			close($file_read);	
		}
		
		
		else {
		print "Please press 1 or 2 \n";
		}


	}		
	
	elsif($choice == 1){
		#Show Phone Book
		open ( my $file_read, "<", "$path/phoneBook.txt" ) or die "Can't open the text file for reading ($!)\n";
		while(<$file_read>){
			print "$_";
		}
		close($file_read);
	}
	
	elsif($choice == 3){
	#Delete a Contact
		print "ATTENTION! YOU CHOSE TO DELETE A CONTACT\n";
		open ( my $file_read, "<", "$path/phoneBook.txt" ) or die "Can't open the text file for reading ($!)\n";
		print "Enter the contact name\n";
		my $contact_name = <STDIN>;
		chomp($contact_name);
		$contact_name = uc ($contact_name);
		print "Enter the contact number\n";
		my $contact_number = <STDIN>;
		chomp($contact_number);
		open (my $file_write, ">", "$path/newphoneBook.txt" ) or die "Can't open the text file for writing ($!)\n";
		while(<$file_read>){
			my $letter = $_;
			chomp($letter);
			my @contact_array = split /\t/, $letter;
			if(defined $contact_name_array[0] && defined $contact_array[1] && $contact_array[0] eq $contact_name && $contact_array[1] == $contact_number){
				print "\nDeleting Contact\n";
				print "Contact Name : $contact_array[0]\n";
				print "Contact Number : $contact_array[1]\n\n";
				sleep 1;
			}
			else{
				print $file_write $_;
			}
		}
		close($file_write);
		close($file_read);
		rename("$path/newphoneBook.txt", "$path/phoneBook.txt") or die "Unable to rename: {$!}\n";
	}	
	
	elsif($choice == 5){
		print "Exiting\n";
		$exit = 1;
		sleep 1;
	}	

	else {
		print " Please press a number from list \n";
	}
}
