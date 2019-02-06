library(RMariaDB)
library(DBI)
# Connect to my-db as defined in ~/.my.cnf
# Use this when taking next step con <- dbConnect(RMariaDB::MariaDB(), group = "my-db")


# R needs a full path to find the settings file.
# rmariadb.settingsfile<-"F:\\br8k_home\\GitHub\\weather\\my.cnf"
rmariadb.settingsfile<-"/home/jcz/Documents/github/weather/my.cnf"

rmariadb.db<-"weather"
weather<-dbConnect(RMariaDB::MariaDB(),default.file=rmariadb.settingsfile,group=rmariadb.db) 

# list the table. This confirms we connected to the database.
dbListTables(weather)

# disconnect to clean up the connection to the database.
dbDisconnect(weather)


# You can fetch all results:
res <- dbSendQuery(weather, "SELECT * FROM E4229_daily")
dbFetch(res)
dbClearResult(res)

# Or a chunk at a time
res <- dbSendQuery(weather, "SELECT * FROM E4229_daily")
while(!dbHasCompleted(res)){
  chunk <- dbFetch(res, n = 5)
  print(nrow(chunk))
}
# Clear the result
dbClearResult(res)

# Disconnect from the database
dbDisconnect(con)