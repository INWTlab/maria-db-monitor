#' Start Application
#'
#' ...
#'
#' @export
startApplication <- function() {
  runApp(
    system.file("app", package = "INWTdbMonitor"),
    port = 3838,
    host = "0.0.0.0"
  )
}
