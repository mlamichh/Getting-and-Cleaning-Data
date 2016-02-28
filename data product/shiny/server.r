library(shiny)
data(mtcars)
n = nrow(mtcars)

shinyServer(
  function(input, output){
    x <- reactive({input$id3/input$id2})
    y <- reactive({input$id1/{input$id3/input$id2}})
    z <- reactive({for (i in 1:n){if (mtcars$mpg[i] >= y()){
      print(rownames(mtcars)[i])
    }
      }
      })
    output$oid1 = renderPrint({x()})
    output$oid2 = renderPrint({y()})
    output$oid3 = renderPrint({z()})
}
)