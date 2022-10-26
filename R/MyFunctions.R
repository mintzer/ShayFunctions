getSqlFile = function(query_path) {
  pacman::p_load(tidyverse, RPostgreSQL)
  pconn_rsql <- dbConnect(dbDriver("PostgreSQL"),
                          host = "appcentral-redshift.cztl3hnubism.us-east-1.redshift.amazonaws.com",
                          port = 5439,
                          user = "admin",
                          password = "ChenChen123",
                          dbname = "dev")
  query = read_file(paste0(query_path, '.sql'))
  df = dbGetQuery(pconn_rsql, query)
  dbDisconnect(pconn_rsql)
  return(df)
}


getSqlQuery = function(query) {
  pacman::p_load(tidyverse, RPostgreSQL)
  pconn_rsql <- dbConnect(dbDriver("PostgreSQL"),
                          host = "appcentral-redshift.cztl3hnubism.us-east-1.redshift.amazonaws.com",
                          port = 5439,
                          user = "admin",
                          password = "ChenChen123",
                          dbname = "dev")
  df = dbGetQuery(pconn_rsql, query)
  dbDisconnect(pconn_rsql)
  return(df)
}
