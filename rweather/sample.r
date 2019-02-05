library(RMariaDB)
library(DBI)
# Connect to my-db as defined in ~/.my.cnf
# Use this when taking next step con <- dbConnect(RMariaDB::MariaDB(), group = "my-db")


# R needs a full path to find the settings file.
rmariadb.settingsfile<-"F:\\br8k_home\\GitHub\\weather\\my.cnf"


rmariadb.db<-"weather"
weather<-dbConnect(RMariaDB::MariaDB(),default.file=rmariadb.settingsfile,group=rmariadb.db) 

# list the table. This confirms we connected to the database.
dbListTables(weather)

# disconnect to clean up the connection to the database.
dbDisconnect(weather)

localuserpassword <- "yub.miha"
library(RMariaDB)
# The connection method below uses a password stored in a variable.  
# To use this set localuserpassword="The password of newspaper_search_results_user" 

weather <- dbConnect(RMariaDB::MariaDB(), user='jcz', password=localuserpassword, dbname='weather', host='192.168.1.110')
dbListTables(weather)
dbDisconnect(weather)

dbListTables(con)
dbWriteTable(con, "mtcars", mtcars)
dbListTables(con)

dbListFields(con, "mtcars")
dbReadTable(con, "mtcars")

# You can fetch all results:
res <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
dbFetch(res)
dbClearResult(res)

# Or a chunk at a time
res <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
while(!dbHasCompleted(res)){
  chunk <- dbFetch(res, n = 5)
  print(nrow(chunk))
}
# Clear the result
dbClearResult(res)

# Disconnect from the database
dbDisconnect(con)