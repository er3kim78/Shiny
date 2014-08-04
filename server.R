library(ggvis)
library(ggplot2)
library(dplyr)


getwd()
# set working directory
setwd("C:/Users/Eric.Kim/Desktop/TSA Files/R Scripts/Shiny VRC")


# read the data
vrc<- read.csv("Data File Example.csv", header = TRUE, sep=",")
str(vrc)
vrc$Impr<-as.numeric(vrc$Impr)
str(vrc)

shinyServer(
  
  function(input, output) {
    
    main_plot <- reactive({ 
      xvar<-switch(input$xvar, 
                   "Clicks" = vrc$Clicks,
                   "Cost" = vrc$Cost,
                   "Impr" = vrc$Impr)
      yvar<-switch(input$yvar, 
                   "Clicks" = vrc$Clicks,
                   "Cost" = vrc$Cost,
                   "Impr" = vrc$Impr)
      
      vrc%>%
        ggvis(~xvar, ~yvar, opacity:=0.4, key:=~Keyword) %>%
        layer_points() %>%
        #    layer_text(text:=as.character(vrc$Account)) %>%  
        add_tooltip(function(vrc){paste0("Keyword: ", vrc$Keyword,"<br>xvar: ",vrc$xvar, "<br>yvar: ",  vrc$yvar)},"hover")
      #   plot(xvar, yvar)
    })
    main_plot %>% bind_shiny("plot1")
  })
