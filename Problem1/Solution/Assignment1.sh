#!/bin/bash

input_file=$1

if [ ! -f $input_file ]
then
    echo "The input csv file does not exists!!!"
    exit
fi
c=0
while IFS="," read -r col1 col2 col3 col4
do
    ((c++))
    if [ $c -eq 1 ]
    then
        continue
    fi
    output_file="$col1.vcf"
    if [ -f $output_file ]
    then
             
        old_version_string=$(head -n 2 $output_file | tail -1)
        len=${#old_version_string}
        
       
        old_version_no=${old_version_string:8:`expr $len - 8`}
        
        new_version_no=$((old_version_no + 1))
        #echo "New version No. ${new_version_no}"        
    
        version="VERSION:"
        version="$version$new_version_no"
     
        echo "BEGIN:VCARD" > $output_file
        echo $version >> $output_file
    else
        
        touch $output_file
        
        echo "BEGIN:VCARD" > $output_file
        echo "VERSION:1" >> $output_file
    fi
    
    echo -e "\nName    : $col1" >> $output_file
    echo "MIS     : $col2" >> $output_file
    echo "Mobile  : $col3" >> $output_file
    echo -e "Age     : $col4 \n" >> $output_file
     
    echo "END:VCARD" >> $output_file
done < $input_file
