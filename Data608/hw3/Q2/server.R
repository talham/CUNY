library(ggplot2)
library(dplyr)
library(shiny)
library(maps)
library(plotly)


function(input, output) {
  
  selectedData <- reactive({
    dfslice <- cdc_data %>%
      filter(ICD.Chapter == input$ICD, State == input$state)
  })
  
  USavg<-cdc_data %>% group_by(ICD.Chapter,Year) %>% summarize(tot_d=sum(Deaths),tot_pops=sum(Population)) 
  USavg<-USavg %>% mutate(usrate=(tot_d/tot_pops)*100000)
  groupedData <- reactive({
    slice <- USavg %>%
      filter(ICD.Chapter == input$ICD)
             })
  output$plot1 <- renderPlotly({
    plot_ly(selectedData(), x = ~Year, y =~Crude.Rate,type='scatter',mode = 'lines+markers')
     })
  
  output$plot2 <- renderPlot({
    ggplot(groupedData(), aes(x=Year,y=usrate)) + theme_minimal()+geom_line(size=1,colour="orange")+geom_point(size=2,colour="orange")+xlab("Year")+ylab("Rate per Hunderd Thousand People")+ggtitle("Mortality by US Average")
    
  })
}
