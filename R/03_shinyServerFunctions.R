# functions for shiny server -----------------------------

#' Table config
#'
#' ...
#'
#' @export
appDataTable <- function(x) {
  datatable(x,
            options = list(pageLength = 50, searching = FALSE, paging = FALSE, info = FALSE, processing = FALSE))
}

#' Piechart
#'
#' ...
#'
#' @export
appPieChart <- function(label, value, badColor = "#FF9800", goodColor = "#4CAF50") {

  Sys.sleep(0.3) #http://stackoverflow.com/questions/33530066/shiny-googlevis-geochart-not-displaying-with-reactive-switch

  gvisPieChart(
    data.frame(label = label,
               value = value
    ),
    options = list(
      colors = "['" %p0% badColor %p0% "', '" %p0% goodColor %p0% "']",
      sliceVisibilityThreshold = 0,
      pieHole = 0.1)
  )
}

#' reload data by schedule
#'
#' ...
#'
#' @export
reloadBySchedule <- function(dat, schedule, session = getDefaultReactiveDomain()) {
  invalidateLater(configVal(schedule), session)
  dat
}

#' fill engine TokuDB for bufferDat
#'
#' ...
#'
engineFillTokuDB <- function(dat) {
  serverValNum(dat, c("tokudb_cachetable_size_current")) /
                    serverValNum(dat, c("tokudb_cache_size"))
}

#' fill engine InnoDB for bufferDat
#'
#' ...
#'
engineFillInnoDB <- function(dat) {
1 - (serverValNum(dat, c("innodb_buffer_pool_pages_free")) /
                          serverValNum(dat, c("innodb_buffer_pool_pages_total")))
}

#' which engines for bufferDat are present
#'
#' ...
#'
enginePresent <- function(dat) {
  if (length(engineFillTokuDB(dat)) != 0 & length(engineFillInnoDB(dat)) != 0) {
    c("TokuDB", "InnoDB")
  } else if (length(engineFillTokuDB(dat)) == 0 & length(engineFillInnoDB(dat)) != 0) {
    "InnoDB"
  } else if (length(engineFillTokuDB(dat)) != 0 & length(engineFillInnoDB(dat)) == 0) {
    "TokuDB"
  } else{
    vector()
  }
}


#' dataset with buffer statistic
#'
#' ...
#'
#' @export
bufferDat <- function(dat) {
  data.frame(
    engine = enginePresent(dat),
    Filled = c(engineFillTokuDB(dat), engineFillInnoDB(dat))
  ) %>% mutate(Free = 1 - Filled)
}

#' total buffer innodb + tokudb
#'
#' ...
#'
#' @export
bufferTotDat <- function(dat) {
  sum(engineFillTokuDB(dat) * serverValNum(dat, "tokudb_cache_size"),
      engineFillInnoDB(dat) * serverValNum(dat, "KPI_bufPoolSize")
  )
}
