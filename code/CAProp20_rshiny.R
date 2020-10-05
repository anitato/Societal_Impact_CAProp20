---
output: html_document
runtime: shiny
---
  
library(shiny)
library(shinydashboard)
library(ggplot2)
library(scales)

# setwd("~/Documents/GitHub/")

# variables from other analyses used as input to functions
total_crime=readRDS("Societal_Impact_CAProp20/data/total_crime.RDS")
total_cost=readRDS("Societal_Impact_CAProp20/data/total_cost.RDS")
avg_cost=readRDS("Societal_Impact_CAProp20/data/avg_cost.RDS")
conf_int_wobblers_entering_prison=readRDS("Societal_Impact_CAProp20/data/wobbler_range.RDS")

yearly_inmate_cost=81203 # see https://lao.ca.gov/PolicyAreas/CJ/6_cj_inmatecost

# Add third sliding scale

## Some variables
AppTitle <- strong("Proposition 20 Costs")
PlotTitle <- strong("Costs of passing Prop 20")
VariablesTitle <- "Variables"

dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)


ui <- dashboardPage(
  
  dashboardHeader(title=AppTitle),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Plots", tabName = "dashboard"),
      menuItem("Learn more", tabName= "links")
    ) ),
  
  dashboardBody(
    
    tabItems(
      tabItem(tabName="links",
              fluidRow(
                box(
                  width= 8, status = "info", solidHeader = TRUE,
                  title = "Want to know more?",
                  uiOutput("link1"),
                  uiOutput("link2"),
                  uiOutput("text1"),
                  uiOutput("link3"),
                  uiOutput("link4"),
                  uiOutput("link5"),
                  uiOutput("link6"),
                  uiOutput("text2"),
                  uiOutput("link7"),
                  uiOutput("link8"),
                  uiOutput("link9"),
                  uiOutput("link10"),
                ) )),
      
      tabItem(tabName= "dashboard", 
              fluidRow(
                valueBoxOutput("crimerate"),
                valueBoxOutput("anncost"),
                valueBoxOutput("netcost"), 
              ),
              
              fluidRow(
                box(
                  width= 8, status = "info", solidHeader = TRUE,
                  title = PlotTitle,
                  plotOutput("MainPlot", width = "100%", height = 600)
                ),
                box(
                  width = 4, status = "info",
                  # Comment out the following line if you don't want that title there
                  title = VariablesTitle,
                  # value = default value, no default value will give you error message
                  sliderInput("crimeratein", "Percent Reduction in Rates of Property Crimes costing less than $950:", min = 0, max = 100, value = 25), 
                  sliderInput("numpeople", "Number of New Prison Inmates per Year under Prop 20:", min = round(min(conf_int_wobblers_entering_prison)), max = round(max(conf_int_wobblers_entering_prison)), step= 1, value= round(mean(conf_int_wobblers_entering_prison))),
                  sliderInput("pristime", "Average Sentence Length:", min = 1.3, max = 3, step= .1, value= 3)
                  # radioButtons("pristime", "Average Sentence Length:",
                  #              c("16 months" = 16/12 - 1, #subtracting 1 because we compare to baseline time in jail
                  #                "2 years" = 2 - 1 ,
                  #                "3 years" = 3 - 1), selected = (3-1))
                ) )
      ) )
  ) )


server <- function(input, output) {
  
  # For the Learn More section, add all the links here
  
  url1 <- a("For methods, see our Github ReadMe", href="https://github.com/anitato/Societal_Impact_Prop20")
  url2 <- a("2020 – Proposition 20", href="https://ballotpedia.org/California_Proposition_20,_Criminal_Sentencing,_Parole,_and_DNA_Collection_Initiative_(2020)#Assembly_Bill_109_.282011.29 ")
  url3 <- a("2016 – Proposition 57", href="https://ballotpedia.org/California_Proposition_57,_Parole_for_Non-Violent_Criminals_and_Juvenile_Court_Trial_Requirements_(2016) ")
  url4 <- a("2014 – Proposition 47", href="https://ballotpedia.org/California_Proposition_47,_Reduced_Penalties_for_Some_Crimes_Initiative_(2014)")
  url5 <- a("2012 – Proposition 36", href="https://ballotpedia.org/California_Proposition_36,_Changes_in_the_%22Three_Strikes%22_Law_(2012) ")
  url6 <- a("2011 – AB 109", href="https://www.shouselaw.com/ca/defense/laws/ab-109/")
  url7 <- a("Cost of inmate/year in CA", href="https://lao.ca.gov/PolicyAreas/CJ/6_cj_inmatecost")
  url8 <- a("Prop 20 Full Text", href="https://vig.cdn.sos.ca.gov/2020/general/pdf/topl-prop20.pdf")
  url9 <- a("Prop 20 Full Text", href="https://vig.cdn.sos.ca.gov/2020/general/pdf/topl-prop20.pdf")
  url10 <- a("Prop 20 Full Text", href="https://vig.cdn.sos.ca.gov/2020/general/pdf/topl-prop20.pdf")
  
  output$link1 <- renderUI({
    tagList("[1]", url1)})
  output$link2 <- renderUI({
    tagList("[2]", url2)})
  output$link3 <- renderUI({
    tagList("[3]", url3)})
  output$link4 <- renderUI({
    tagList("[4]", url4)})
  output$link5 <- renderUI({
    tagList("[5]", url5)})
  output$link6 <- renderUI({
    tagList("[6]", url6)})
  output$link7 <- renderUI({
    tagList("[7]", url7)})
  output$link8 <- renderUI({
    tagList("[8]", url8)})
  output$link9 <- renderUI({
    tagList("[9]", url9)})
  output$link10 <- renderUI({
    tagList("[10]", url10)})
  output$text1 <- renderUI({
    tagList("For the history of Prop 20 and incarceration in California:")})
  output$text2 <- renderUI({
    tagList("Other links/data:")})
  
  
  # The data for plotting 
  # Here,the variables will be a function of the crime rate and time in prison that the user selected
  newData <- reactive({
    df1 <- data.frame(moneycat = factor(c("Crime Reduction Refund", "Prison Costs", "Net Difference to Society"), levels = c("Net Difference to Society", "Crime Reduction Refund", "Prison Costs")), value = c(1,2,3))
    df1$value[1] <- (input$crimeratein/100) * total_crime *  avg_cost   # So here goes the function for the money saved
    df1$value[2] <- (as.numeric(input$pristime)-1) * input$numpeople * -yearly_inmate_cost # Here goes the function for the costs
    df1$value[3] <- df1$value[2] + df1$value[1] # This is supposed to be the difference
    df1$colour.c <- ifelse(df1$value < 0, "firebrick1", "steelblue")
    df1$hjust <- ifelse(df1$value > 0, 1.3, -0.3)
    df1
  })
  
  # The plot
  output$MainPlot <- renderPlot(
    ggplot(newData(), aes(moneycat, value , label = moneycat, hjust = hjust)) +
      geom_text(aes(y = 0, colour = colour.c)) +
      geom_bar(stat = "identity", aes(fill = colour.c)) +
      scale_colour_manual(values = c("#e74c3c", "#0073b7"), aesthetics = c("colour", "fill")) +
      scale_x_discrete(breaks = NULL) +
      scale_y_continuous(breaks = seq(-365000000, 365000000, 100000000), labels = comma, limits = c(-365000000, 365000000)) +
      # ylim(-365000000, 365000000) +
      geom_hline(yintercept = 0, linetype ="dashed") +
      labs(x = "", y = "") +
      theme_bw() +
      theme(legend.position= "none", axis.text.x = element_text(angle = 45,hjust=1,vjust=1)) +
      coord_flip() ,
    res=96)
  
  # For the three boxes
  output$crimerate <- renderValueBox({
    valueBox(
      value = input$crimeratein,
      subtitle = "Property Crime Rate Reduction",
      color = "navy",
      icon = icon("percent")
    )
  })
  
  # To calculate annual cost, we use the same function as in the plot
  output$anncost <- renderValueBox({
    valueBox(
      value = format( ((as.numeric(input$pristime)-1) * input$numpeople * -yearly_inmate_cost), big.mark=","),
      subtitle = "Total Annual Cost of Prisons per Year", 
      color= "red",
      icon = icon("dollar-sign")
    )
  }) 
  
  # if( (as.numeric(input$pristime) * input$numpeople * -yearly_inmate_cost) + ((input$crimeratein) * total_crime *  avg_cost) > 0){
  #   plotcolor.net = "green"
  # } else{
  #   plotcolor.net = "red"
  # }
  # Net difference between cost and saved $$$
  output$netcost <- renderValueBox({
    if( (((as.numeric(input$pristime)-1) * input$numpeople * -yearly_inmate_cost) + ((input$crimeratein/100) * total_crime *  avg_cost)) > 0) {
      valueBox(
        value = format( ((as.numeric(input$pristime)-1) * input$numpeople * -yearly_inmate_cost) + ((input$crimeratein/100) * total_crime *  avg_cost), big.mark=","),
        subtitle = "Net Difference to Society per Year", 
        color= "blue",
        icon = icon("dollar-sign")
      )
    } else {
      valueBox(
        value = format( ((as.numeric(input$pristime) * input$numpeople * -yearly_inmate_cost) + (input$crimeratein/100) * total_crime *  avg_cost), big.mark=","),
        subtitle = "Net Difference to Society per Year", 
        color= "red",
        icon = icon("dollar-sign")
      )
    }
    
  })
  
}

shinyApp(ui, server)
