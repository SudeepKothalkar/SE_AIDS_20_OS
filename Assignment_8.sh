/*write a program to implement an address book with option given below:
a) create address book 
b) View address  book 
c) Insert a record 
d) Delete a record
e) Modify a record
f) Exit*/
#!/bin/sh
opt=1
while [ "$opt" -lt 6 ];
do

	echo -e "Choose one of the Following\n1. Create a New Address Book\n2. View Records\n3. Insert new Record\n4. Delete a Record\n5. Modify a Record\n6. Exit"
	# echo -e, enables special features of echo to use \n \t \b etc.
	read opt
	case $opt in

	
		echo "Enter filename"
		read fileName
		if [ -e $fileName ] ; then	# -e to check if file exists, if exits remove the file
			rm $fileName
		fi
		cont=1
		echo  "NAME\tNUMBER\t\tADDRESS\n===============================\n" | cat >> $fileName
		while [ "$cont" -gt 0 ]
		do
			echo "\nEnter Name"
			read name
			echo "Enter Phone Number of $name"
			read number
			echo "Enter Address of $name"
			read address
			echo "$name\t$number\t\t$address" | cat >> $fileName
			echo "Enter 0 to Stop, 1 to Enter next"
			read cont
		done
		;;

	
		cat $fileName
		;;
	
		echo "\nEnter Name"
		read name
		echo "Enter Phone Number of $name"
		read number
		echo "Enter Address of $name"
		read address
		echo "$name\t$number\t\t$address" | cat >> $fileName
		;;
	
		echo "Delete record\nEnter Name/Phone Number"
		read pattern
		temp="temp"
		grep -v $pattern $fileName | cat >> $temp 
		rm $fileName
		cat $temp | cat >> $fileName
		rm $temp
		;;
	
		echo "Modify record\nEnter Name/Phone Number"
		read pattern
		temp="temp"
		grep -v $pattern $fileName | cat >> $temp
		rm $fileName
		cat $temp | cat >> $fileName
		rm $temp
		echo "Enter Name"
		read name
		echo "Enter Phone Number of $name"
		read number
		echo "Enter Address of $name"
		read address
		echo -e "$name\t$number\t$address" | cat >> $fileName
		;;
	esac
done