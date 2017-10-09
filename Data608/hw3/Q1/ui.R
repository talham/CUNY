fluidPage(
  headerPanel('CDC Disease Mortality Rates in 2010'),
  sidebarPanel(
    selectInput('ICD', 'Diseases', choices=cdc_data$ICD.Chapter, selected='Neoplasms')
  ),
  mainPanel(
          tabPanel("Plot",
               fluidRow(
                 column(12, plotOutput("plot1")),
                 column(12, plotOutput("plot2"))
               ))
  )
)