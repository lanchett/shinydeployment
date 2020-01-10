
# Use ShinyDashboard
library(shinydashboard)
library(shiny)
library(DT)
library(dplyr)

ui <- dashboardPage(
  dashboardHeader(title = "Drinkathon Dashboard"),
  dashboardSidebar(sidebarMenu(
    menuItem("Drinkmeny", tabName = "Drinkmeny", icon = icon("th")),
    menuItem("Bestillinger", tabName = "Bestillinger", icon = icon("th"))
  )),
  dashboardBody(tabItems(
    tabItem(
      tabName = "Drinkmeny",
      h2("Finn noe du liker"),
      
      fluidRow(box(title = "GT",
                   tags$a(a(
                     img(src = 'GT.jpg')
                   ))),
      box(title = "Mojito",
                   tags$a(a(
                     img(src = 'Mojito.jpg')
                   ))),
      box(title = "Whisky Sour",
                   tags$a(a(
                     img(src = 'Whisky.jpg')
                   ))),
      box(title = "Aloe Vera",
          tags$a(a(
            img(src = 'Aloe_Vera.jpg')
          ))),
      box(title = "Knickerbocker",
          tags$a(a(
            img(src = 'Knickerbocker.jpg')
          ))),
      box(title = "Sure Føtter",
          tags$a(a(
            img(src = 'Sure_fotter.jpg')
          ))))
    ),
    
    tabItem(
      tabName = "Bestillinger",
      selectInput(
        "Drink",
        "Drink:",
        c(
          "GT" = "GT",
          "Mojito" = "Mojito",
          "Whisky Sour" = "Whisky Sour",
          "Sure Føtter" = "Sure Føtter",
          "Knickerbocker" = "Knickerbocker",
          "Aloe Vera" = "Aloe Vera"
          
        )
      ),
      textInput("Navn", "Skriv ditt navn"),
      br(),
      actionButton("goButton", "Bestill nå"),
      verbatimTextOutput("nText"),
      verbatimTextOutput("orders_total"),
      hr(),
      actionButton("sebestillinger","Se bestillingsoversikt"),
      dataTableOutput("summary_table")
    )
  ))
)
