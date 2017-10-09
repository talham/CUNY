fluidPage(
  headerPanel('CDC Disease Mortality Rates'),
  sidebarPanel(
    selectInput('ICD', 'Diseases', choices=cdc_data$ICD.Chapter, selected='Neoplasms'),
    selectInput('state','State',choices=cdc_data$State, selected = "NY") 
     ),
  mainPanel(
    tabPanel("Plot",
             fluidRow(
               column(12, plotlyOutput("plot1")),
               column(12, plotOutput("plot2"))
             ))
  )
)