library(RMariaDB)
library(DBI)
# Connect to my-db as defined in ~/.my.cnf
# Use this when taking next step con <- dbConnect(RMariaDB::MariaDB(), group = "my-db")

localuserpassword <- "yub.miha"
library(RMariaDB)
# The connection method below uses a password stored in a variable.  
# To use this set localuserpassword="The password of newspaper_search_results_user" 

myDb <- dbConnect(RMariaDB::MariaDB(), user='newspaper_search_results_user', password=localuserpassword, dbname='newspaper_search_results', host='localhost')
dbListTables(storiesDb)
dbDisconnect(storiesDb)

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