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
	my $count = 0;
	my @alphabet = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
	if(!(-e "$path/phoneBook.txt")){
		my @phonebook_sorting_array = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
		open ( my $file_write, ">", "$path/phoneBook.txt" ) or die "Can't open the text file for writing ($!)\n";
		while(<@alphabet>){
			print $file_write $alphabet[$count], "\n";
			$count+=1;
		}
		close($file_write);
		$count = 0;
	}
	open ( my $file_read_sort, "<", "$path/phoneBook.txt" ) or die "Can't open the text file for writing ($!)\n";
	my $phonebook_sorting_array_length=0;
	while(<$file_read_sort>){
		push(@phonebook_sorting_array, $_);
		$phonebook_sorting_array_length+=1;
	}
	close($file_read_sort);
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
#							SORTING PART STARTS
#----------------------------------------------------------------------------------------------------------------------------
		my $phonebook_element_name_length = 0;
		my $phonebook_sorting_array_element = 0;
		my $outer_founded_flag = 0;
		my $inner_founded_flag = 0;
		my $alphabet_letter_count = 0;
		my $contact_name_letter_count = 0;
		my $phonebook_element_name_letter_count = 0;
		my $break_addition = 0;
		my @temp_array;
		my @temp_array2;
		my $count_temp;
		my @phonebook_sorting_array_element_array;
		while (1){
			qx/sleep 1/;
			@temp_array2 = ();
			@temp_array2 = split '\t', $phonebook_sorting_array[$phonebook_sorting_array_element];
			chomp(@temp_array2);
			print "TEMP_ARRAY2 : @temp_array2 \n";
			@phonebook_sorting_array_element_array =split '', $temp_array2[0];
			print "SORT_PHONEBOOK : @phonebook_sorting_array_element_array \n";
			print "SORT GIVEN : @contact_name_array[0] \n";
			foreach (@phonebook_sorting_array_element_array){
				$phonebook_element_name_length+=1;
			}
			print "Phonebook element name length : $phonebook_element_name_length \n";
			$count_temp = $phonebook_element_name_length;
			print "liste kelime uzunluğu : $phonebook_element_name_length \n";
			$phonebook_element_name_length = 0;
			print "Count temp : $count_temp \n";
		
#----------------------------------------------------------------------------------------------------------------------------
			if($outer_founded_flag == 0){
				print "Outer Flag Started \n";
				foreach my $letter_index (0..$count_temp-1){
					print "------------------------------- \n";
					print "TEMP ARRAY : @temp_array \n";
					print "Letter index : $letter_index \n";
					print "Outer For Started \n";
					if($inner_founded_flag == 0){
						print "Inner flag started \n";
						foreach my $alphabet_letter (@alphabet){
							print "Inner For Started \n";
							print "Alphabet letter : $alphabet_letter \n",;
							print "Contact name array : $contact_name_array[$letter_index]\n";
							print "Phonebook name array : $phonebook_sorting_array_element_array[$letter_index]\n";
							if ($contact_name_array[$letter_index] eq $alphabet_letter){
								print "Contact name letter founded \n";
								$contact_name_letter_count = $alphabet_letter_count;
								$break_addition+=1;
							}
							if ($phonebook_sorting_array_element_array[$letter_index] eq $alphabet_letter){
								print "Phonebook name letter founded \n";
								$phonebook_element_name_letter_count = $alphabet_letter_count;
								$break_addition+=1;
							}
							# When letters are founded, loop must be ended
							if ($break_addition == 2){
								$break_addition = 0;
								$alphabet_letter_count = 0;
								print "Break \n";
								last;
							}
							$alphabet_letter_count+=1;
							print "Inner alphabet letter count : $alphabet_letter_count \n";
							print "Break addition : $break_addition \n";
						}
					}
					print "Outer alphabet letter count : $alphabet_letter_count \n";
					$alphabet_letter_count = 0;
					
					if($phonebook_element_name_letter_count == $contact_name_letter_count){
						# Kelimelerin seçilen harfleri aynı ise
						# Phonebooktaki elemanın bir sonraki harfi yok ise
						print scalar @phonebook_sorting_array_element_array, "\n";
						if(scalar @phonebook_sorting_array_element_array < $letter_index+1){
							print "Next Element \n";
							last;
						}
						print scalar @contact_name_array, "\n";
						print "Letter index'indeki buffer'ın bir fazlasi : $letter_index+1 \n";
						# Verilen elemanın bir sonraki harfi yok ise
						if(scalar @contact_name_array < $letter_index+2){
							print "Harfler aynı verilen kelime kısa. Verilen kelime eklendir \n";
							push(@temp_array, $contact_name);
							print "A harfi için letter indexten küçük olduğu anında letter index : $letter_index \n";
							$outer_founded_flag = 1;
							$inner_founded_flag = 1;
							last;
						}
					}
					else {
					# Kelimelerin seçilen harfleri farklı ise
						if ($contact_name_letter_count < $phonebook_element_name_letter_count){
							# Girilen kelimenin harfi daha önce geliyor
							# Appending given contact name to an temp array
							# Ya ile Z harfinin karşılaştırılması
							push(@temp_array, $contact_name);
							$outer_founded_flag = 1;
							$inner_founded_flag = 1;
							last;
						}
						# Girilen kelimenin ilk harfi sonra geliyor
						if ($contact_name_letter_count > $phonebook_element_name_letter_count){
							# Girilen isim Ya harf A ile karşılaştırıldı. Sonraki kelimeye geçilecektir.
							print "Next element \n";
							print "@temp_array\n";
							last;
						}
					}
					
				
				
				}
			}
#----------------------------------------------------------------------------------------------------------------------------
			print "Quitting from outer for \n";
			push(@temp_array, $phonebook_sorting_array[$phonebook_sorting_array_element]);
			$phonebook_sorting_array_element+=1;
			print "Temp array : @temp_array \n";
		}
#----------------------------------------------------------------------------------------------------------------------------
#							SORTING PART ENDS
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
