#!/bin/bash
source my.config
for table in $(mysql $dbconnect -D weather -Bse "show tables");
do 
    echo "------"
    echo $table ": " 
    mysql $dbconnect -D weather -se "select count(*) from $table";
done
