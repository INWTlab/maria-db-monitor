#' @importFrom dbtools Credentials sendQuery testConnection
#' @importFrom dplyr arrange filter rename count cummean distinct_ filter first
#'   funs group_by inner_join lag lead left_join matches mutate rowwise union
#'   select slice summarise summarise_all
#' @importFrom DT datatable formatCurrency formatStyle dataTableOutput
#'   styleColorBar styleInterval formatRound renderDataTable dataTableProxy
#'   replaceData
#' @importFrom dygraphs dygraphOutput renderDygraph dygraph dyAxis dySeries
#'   dyOptions dyLegend dyRangeSelector dyHighlight
#' @importFrom googleVis gvisBarChart renderGvis gvisPieChart
#' @importFrom humanFormat formatIECBytes
#' @importFrom lubridate seconds_to_period
#' @importFrom magrittr %>%
#' @importFrom rhandsontable renderRHandsontable rhandsontable hot_col
#'   rHandsontableOutput hot_to_r
#' @importFrom RMySQL MySQL dbConnect dbDisconnect dbSendQuery dbFetch
#'   dbClearResult
#' @importFrom shiny runApp tag div tags fluidRow renderTable
#' @importFrom shinydashboard dashboardHeader dashboardSidebar dashboardBody
#'   dashboardPage box sidebarMenu menuItem tabItem tabItems dropdownMenuOutput
#'   dropdownMenu sidebarSearchForm tabItem tabBox notificationItem
#' @importFrom stats na.omit
#' @importFrom tidyr spread gather_
#' @importFrom xts xts
NULL

#' @export
shiny::renderTable

#' @export
shinydashboard::box

#' @export
shinydashboard::dashboardHeader

#' @export
shinydashboard::notificationItem

#' @export
shinydashboard::dashboardSidebar

#' @export
shinydashboard::dashboardBody

#' @export
shinydashboard::dashboardPage

#' @export
shinydashboard::dropdownMenuOutput

#' @export
shinydashboard::dropdownMenu

#' @export
shinydashboard::sidebarSearchForm

#' @export
shinydashboard::tabItem

#' @export
shinydashboard::tabBox

#' @export
shinydashboard::sidebarMenu

#' @export
shinydashboard::menuItem

#' @export
shinydashboard::tabItems

#' @export
googleVis::gvisBarChart

#' @export
googleVis::renderGvis

#' @export
googleVis::gvisPieChart


#' @export
humanFormat::formatIECBytes


#' @export
lubridate::seconds_to_period

#' @export
dygraphs::dygraphOutput

#' @export
dygraphs::renderDygraph

#' @export
dygraphs::dygraph

#' @export
dygraphs::dyAxis

#' @export
dygraphs::dySeries

#' @export
dygraphs::dyOptions

#' @export
dygraphs::dyLegend

#' @export
dygraphs::dyRangeSelector

#' @export
dygraphs::dyHighlight

#' @export
rhandsontable::renderRHandsontable

#' @export
rhandsontable::rhandsontable

#' @export
rhandsontable::hot_col

#' @export
rhandsontable::rHandsontableOutput

#' @export
rhandsontable::hot_to_r

#' @export
xts::xts

#' @export
DT::datatable

#' @export
DT::formatCurrency

#' @export
DT::formatStyle

#' @export
DT::dataTableOutput

#' @export
DT::styleColorBar

#' @export
DT::styleInterval

#' @export
DT::formatRound

#' @export
DT::renderDataTable

#' @export
DT::dataTableProxy

#' @export
DT::replaceData

#' @export
magrittr::`%>%`

#' @export
dplyr::filter

#' @export
dplyr::mutate

#' @export
tidyr::spread
