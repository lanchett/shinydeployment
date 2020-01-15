
# Use ShinyDashboard
library(shinydashboard)
library(shiny)
#library(dplyr)
library(mongolite)


ui <- dashboardPage(
  dashboardHeader(title = "Drinkathon Dashboard"),
  dashboardSidebar(sidebarMenu(
    menuItem("DrinkMenu", tabName = "DrinkMenu", icon = icon("th")),
    menuItem("Orders", tabName = "Orders", icon = icon("th"))
  )),
  dashboardBody(tabItems(
    tabItem(
      tabName = "DrinkMenu",
      h2("Find something you like"),
      
      fluidRow(box(title = "GT",
                   tags$a(a(
                     img(src = "https://github.com/lanchett/shinydeployment/blob/master/app/www/GT.jpg?raw=true")
                   )))),
      fluidRow(box(title = "Mojito",
                   tags$a(a(
                     img(src = "https://github.com/lanchett/shinydeployment/blob/master/app/www/Mojito.jpg?raw=true")
                   )))),
    fluidRow(box(title = "Whisky Sour",
                 tags$a(a(
                   img(src ="https://github.com/lanchett/shinydeployment/blob/master/app/www/Whisky.jpg?raw=true")
                   )))),
    fluidRow(box(title = "Aloe Vera",
          tags$a(a(
            img(src = "https://github.com/lanchett/shinydeployment/blob/master/app/www/Aloe_Vera.jpg?raw=true")
          )))),
    fluidRow(box(title = "Knickerbocker",
          tags$a(a(
            img(src = "https://github.com/lanchett/shinydeployment/blob/master/app/www/Knickerbocker.jpg?raw=true")
          )))),
    fluidRow(box(title = "Sure Føtter",
          tags$a(a(
            img(src = "https://github.com/lanchett/shinydeployment/blob/master/app/www/Sure_fotter.jpg?raw=true")
          ))))
    ),
    
    tabItem(
      tabName = "Orders",
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
      textInput("Name", "Write Your Name"),
      br(),
      actionButton("goButton", "Order Now"),
      verbatimTextOutput("nText"),
      hr(),
      actionButton("seeOrders","See Orders"),
      tableOutput("summary_table")
    )
  ))
)
