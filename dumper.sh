#!/bin/bash
for table in $(mysql -uroot -pyub.miha -D weather -Bse "show tables");
do 
    echo "------"
    echo $table ": " 
    mysql -uroot -pyub.miha -D weather -se "select count(*) from $table";
done
