#-------------------------------------------------------------------------------
#
#   Functions for duckDB
#
#       Author  : Amir Azmi
#       Created : 22 May 2026
#       Updated : 26 May 2026
#
#-------------------------------------------------------------------------------
library(pacman)
p_load(duckdb)
p_load(dplyr)
p_load(lubridate)

#-------------------------------------------------------------------------------
cat( str_pad( "\n[+] duckdb_funcs.R ", 40, "right", "-"),
     " loaded [", format(now(), "%Y-%m-%d %H:%M:%S"), "]")

#-------------------------------------------------------------------------------
#    if( dbIsValid( dbconn)) {
#        dbCmd("CHECKPOINT;", dbconn)      # this merges wal
#        dbDisconnect( dbconn)
#    }
#-------------------------------------------------------------------------------

# Template dbspec
dbspec <- list( filename = "", path = "")


# create DB connection
DBconn <- function(dbspec=dbspec){
    conn <- tryCatch({
        dbConnect(
            duckdb(config = list(extension_directory = dbspec$path, secret_directory = dbspec$path)),
            dbdir = file.path( dbspec$path, dbspec$filename),
            read_only = FALSE)
    },error=function(e){
        cat( "\n[!!!] Error connecting to DATABASE - Please check DBspec\n Errormsg:")
        print(e)
        return(FALSE)
    })
    dbCmd( "LOAD icu;", conn)      # INSTALL icu;
    return( conn)
}


# SQL query function - SELECT statements only
dbQuery <- function( stmt="", dbconn){
    dbconn <<- if( dbIsValid(dbconn)){ dbconn }else{ DBconn(dbspec)  }
    query <- dbGetQuery( dbconn, stmt ) # dbGetQuery for SELECT statements only
    # dbDisconnect(dbconn)
    return(query)
}


# SQL query other commands
dbCmd <- function( stmt="", dbconn){
    dbconn <<- if( dbIsValid(dbconn)){ dbconn }else{ DBconn(dbspec)  }
    query <- dbSendStatement( dbconn, stmt )
    dbHasCompleted(query)
    cat( "\t dbCmd - rows affected:", dbGetRowsAffected(query))
    dbClearResult(query)
    # dbDisconnect(dbconn)
    # return("Complete")
}


# SQL query tables
dbTables <- function( dbconn){
    dbconn <<- if( dbIsValid(dbconn)){ dbconn }else{ DBconn(dbspec)  }
    ls_tables <- dbListTables(dbconn)
    # dbDisconnect(dbconn)
    return(ls_tables)
}


dbTableCreation <- function( tablename, dbconn){
    dbconn <<- if( dbIsValid(dbconn)){ dbconn }else{ DBconn(dbspec)  }
    create_table_stmt <- tableName %>% paste0('
CREATE TABLE IF NOT EXISTS "',., '" (
    date        DATE UNIQUE,
    close       DOUBLE,
    volume      BIGINT,
    created     DATETIME NOT NULL DEFAULT current_localtimestamp(),
);') %>% str_wrap
    tableCount_pre <- dbTables(dbconn) %>% length
    dbCmd( create_table_stmt, dbconn)
    tableCount_post <- dbTables(dbconn) %>% length
    if( tableCount_post - tableCount_pre == 1){
        cat( "\n[+] Table ", tablename, " created")
    }else{
        cat( "\n[!] No new tables created (", tablename,")")
    }
}


# write to DB
toDB <- function( tableName, dfdata, dbconn, csv_on_fail=NA, print_msg=T){
    dbconn <<- if( dbIsValid(dbconn)){ dbconn }else{ DBconn(dbspec)  }
    dbupload <- tryCatch({
        # dbWriteTable( dbconn, tableName, dfdata, append=T, overwrite=F, row.names=F)
        dbAppendTable( dbconn, tableName, dfdata)
        # batch <- split( dfdata, 1:nrow(dfdata) %/% 1000)
        # for(chunk in seq_along(batch)){
        #     dbWriteTable( dbconn, tableName, batch[[chunk]],
        #                   append=T, overwrite=F, row.names=F)
        # print(chunk)
        # }
        if(print_msg){ cat( "\n[+] Data has been uploaded\n") }
        TRUE # return TRUE
    },error=function(e){
        cat( "\n[!!!] Error uploading data to DB\n Errormsg:")
        print(e)
        if( !is.na(csv_on_fail)){
            cat("\n[!!!] Saving copy on disk...\n", csv_on_fail)
            write.csv( dfdata, csv_on_fail, row.names=F)
        }else{
            cat("\n[!!!] No file specified for upload failure...\n")
        }
        return(FALSE)
    })
    # dbDisconnect(dbconn)
    # return(dbupload)
}


# format ticker code into table name
mkTableName <- function(tick, unlist=F, debug=F){
    genTableName <- function(x){
        tabName <- x %>% str_replace("\\.", "_") %>% list( ticker=.) %>%
            str_interp( "TSD${ticker}", .) #%>% strwrap()
        if(debug){ cat("\n", tabName, "\n\n") }
        return(tabName)
    }
    ls_tableName <- if( length(tick) > 1){  lapply( tick, genTableName) %>% unlist }
                    else{ genTableName(tick)}
    return(ls_tableName)
}


# clear table
dbClearTable <- function(tableName, dbconn){
    dbconn <<- if( dbIsValid(dbconn)){ dbconn }else{ DBconn(dbspec)  }
    stmt <- str_interp("DELETE FROM ${tableName}") %>% str_wrap
    dbCmd( stmt, dbconn)
    # cat("\n\t Clearing", tableName, "table...")
}


