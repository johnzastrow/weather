#!/bin/bash
# mkdir /tmp/mysql
# sudo chgrp mysql /tmp/mysql
# ls -lR /tmp
# sudo chmod ug+rwX /tmp/mysql
# ls -lR /tmp

source my.config
mysql $dbconnect --skip-column-names weather < exporter.sql