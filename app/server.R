library(shiny)

server <- function(input, output, session) {
  ntext <- eventReactive(input$goButton, {
    saveRDS(data.frame(
        Drink = input$Drink, Navn = input$Navn
      ),
      file = paste0(
        here::here(),
        "/",
        stringi::stri_rand_strings(1, 100),
        ".rds"
      )
    )
    
    list(
      input = input$Drink,
      files = files <-
        list.files(here::here(), pattern = ".rds")
    )
  })
  
  output$nText <- renderText({
    paste(ntext()$input, "er bestilt")
  })
  
  output$orders_total <- renderText({
    paste("Totalt antall bestillinger idag:", length(ntext()$files))
  })
  
  
  data <- eventReactive(input$sebestillinger,{
    files <-
      list.files(here::here(), pattern = ".rds")
    files <-  paste0(
      here::here(),"/", files)
    
    if(is.null(files)){
      return()
    }
    bestillinger <- purrr::map_df(files, ~ readRDS(.x))
    df <- bestillinger
    df
  })
  
  output$summary_table <- renderDataTable({
    data()
  })
  
}
