library(shiny)

url = "url" # Add real URL here
con = tryCatch({
  mongo(collection = "drinkathon", db ="drinks", url= url)
}, warning = function(w) {
  mongo(collection = "drinkathon", db ="drinks", url= url)
}, error = function(e) {
  "Connection not working"
}) 

server <- function(input, output, session) {
    ntext <- eventReactive(input$goButton, {
    if(con ==  "Connection not working"){
      
    } else {
      
      con$insert(data.frame(
        Drink = input$Drink, Name = input$Name, Time = Sys.time()
      ))
    }
    
    list(
      input = input$Drink
    )
  })
  
  output$nText <- renderText({
    paste(ntext()$input, "ordered")
  })
  
  data <- eventReactive(input$seeOrders,{
    if(con ==  "Connection not working"){
      mydata <- data.frame(Drink = "", Name = "", Time = "")
    } else {
    mydata <- con$find()
    mydata$Time <- as.character(mydata$Time)
  
    
  }
    mydata
   } )
  
   output$summary_table <- renderTable({
     data()
   })
   
}


