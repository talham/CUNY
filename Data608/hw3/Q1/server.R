library(ggplot2)
library(dplyr)
library(shiny)
library(maps)


function(input, output) {
  
selectedData <- reactive({
    dfslice <- cdc_data %>%
      filter(ICD.Chapter == input$ICD, Year == 2010)
  })
  
output$plot1 <- renderPlot({
  ggplot(selectedData(), aes(x=Crude.Rate,y=reorder(State,Crude.Rate))) + geom_point(color="red",size=2)+theme_minimal()+scale_x_continuous(breaks=seq(0,500,25))+ggtitle("Mortality Rates by State")+xlab("Rate per Hundred Thousand")+ylab("State")+ theme(axis.text.y = element_text(size =8))
  })
output$plot2 <- renderPlot({
  map("state", col = colors[selectedData()$colorBuckets], fill = TRUE, resolution = 0,
      lty = 1, projection = "polyconic")
  title("Mortality by State")
  legend("bottomleft",leg.txt,horiz=TRUE,fill=colors,cex=0.7)
  })
}