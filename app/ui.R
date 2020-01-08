#
# This ShinyApp shows how to evaluate and compare
# the quality of linear models.
#

# Use ShinyDashboard
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Done", tabName = "Done", icon = icon("th")),
      menuItem("Dtwo", tabName = "Dtwo", icon = icon("th"))
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "Done",
              h2("Drink Two")
      ),
      
      # Second tab content
      tabItem(tabName = "Dtwo",
              h2("Drink Two")
      )
    )
  )
)

