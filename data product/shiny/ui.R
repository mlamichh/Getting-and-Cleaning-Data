library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Select cars for your Trip"),
  sidebarPanel(
    numericInput("id1", 'Trip distance in mile', 0, min = 0, max=30000, step=1),
    numericInput("id2", 'Gas Price per Gallon', 0, min = 0, max=10, step = 1),
    numericInput("id3", 'Estimated Cost in $', 0, min = 0, max=10000, step = 1),
    submitButton('Submit')
    
    ),
  mainPanel(
    h4("Gas in gallon for estimated cost"),
    verbatimTextOutput("oid1"),
    h4("Required car's efficiency in mile per gallon"),
    verbatimTextOutput("oid2"),
    h4("Selected Car"),
    verbatimTextOutput("oid3")
  )
))