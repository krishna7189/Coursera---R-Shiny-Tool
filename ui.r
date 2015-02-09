library(shiny)
library(ggplot2)
library(ggvis)
shinyUI(
  navbarPage(p(h5(strong("Navigate Bar for Plots"), style = "color:Green")),
             
             tabPanel(p(h3(strong("Input Data"),style = "color:green")),
                      
                      titlePanel(p(h2("Basic Visualisation Tool",style = "color:orange"))),
                      br(),
                      sidebarPanel(style="color:black","Input Data",
                                   
                                   wellPanel(fileInput('data', 'Choose CSV File',
                                                       accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv')),
                                             numericInput("obs", "Number of observations to view:",0),
                                             
                                             checkboxInput('header', 'Header', TRUE),
                                             
                                             radioButtons('sep', 'Delimeter',
                                                          c(Comma=',',
                                                            Semicolon=';',
                                                            Tab='\t'),
                                                          'Semicolon'),
                                             radioButtons('quote', 'Quote',
                                                          c(None='',
                                                            'Double Quote'='"',
                                                            'Single Quote'="'"),
                                                          'Double Quote')
                                             
                                   ),
                                   
                                   width=4
                      ),
                      
                      
                      mainPanel(
                        tabsetPanel(position ="above",  
                                    tabPanel(h4("Description"),
                                             h3("Welcome to R Visuals",style = "color:blue"),
                                             p("R has been a great Tool for Visualisations with numerous packages like ggplot2, ggvis, plotify etc."),
                                             p("This tool intends to cover Basic Plots using",strong("ggplot2",style = "color:blue"), "and", strong("ggvis",style = "color:blue"),  "packages"),
                                             br(),
                                             helpText(   a("Click Here for Slidify Presentation",     href="http://rpubs.com/krishna7189/Basic_Visualisation_Tool")),
                                             br(),
                                             helpText(   a("Click Here for Downloading Sample Data Set"   ,  href="https://archive.ics.uci.edu/ml/machine-learning-databases/00222/")),
                                             br(),
                                             p(strong("Tool Features - Input Data",style = "color:blue")),
                                             p("1. Supports any kind of csv/text datasets"),
                                             p("2. Provides Initial Observations based on Users Input to understand the Structure of Dataset"),
                                             p("3. Provides Summary of Dataset"),
                                             p("4. Provides Structure of Dataset - Very helpful to select Options for Making Plots"),
                                             p("5. Navigate Bar to switch for Plots"),
                                             br(),
                                             p(strong("Tool Features - Basic Plots using",em("ggplot Package"),style = "color:blue")),
                                             p("1. Scatter Plots - For Continuous X and Y Variables "),
                                             p("2. Bar Plots - For Categorical Variables (X) with Option for Fill (Y)"),
                                             p("3. Histograms - For Continuous Variables (only X)"),
                                             p("4. Box Plots - For Categorical Variable (X) and Continous Variable (Y)"),
                                             br(),
                                             p("Hope you have fun Using the Tool!!!"),
                                             br(),
                                             helpText(   a("Click Here for Entire R Code",     href="https://github.com/krishna7189/Coursera---R-Shiny-Tool")),
                                             br(),
                                             br(),
                                             p(em("For any clasrifications/ suggestions feel free to contact me at", em("krish7189@yahoo.co.in",style = "color:blue"),em("or at my blog"),em("rcodeeasy.blogspot.sg",style = "color:blue")))
                                             
                                    ),
                                    
                                    tabPanel(h4("DataSet"),h4(textOutput("headname")),
                                             tableOutput("head"),
                                             h4("Summary of the Data Set"),
                                             tableOutput("Summary"),
                                             h4("Structure of Data Set"),
                                             verbatimTextOutput("str")
                                             
                                    )))),
             
             
             tabPanel(p(h3(strong("Basic Plots"),style = "color:green")),
                      titlePanel(p(h2("GGPlots",style = "color:orange"))),
                      
                      sidebarPanel("Variable Selection",
                                   
                                   wellPanel(
                                     selectInput("xvar","Choose X-axis Variable:",""),
                                     selectInput("yvar","Choose Y-axis Variable:","")
                                     
                                     
                                     
                                   )),
                      
                      
                      mainPanel(
                        tabsetPanel(position ="above",                
                                    
                                    "Scatter Plots",
                                    
                                    tabPanel(h4("Scatter Plots"), 
                                             h3("Scatter Plots for Continuous X and Y Variables"),
                                             h5("Choose both X and Y Variable for a Scatter Plot"),
                                             
                                             plotOutput("ScatterPlot")),
                                    
                                    "Bar Plots",
                                    tabPanel(h4("Bar Plot"),
                                             h3("Bar Plots for Categorical Variables"),
                                             h5("Choose X variable for genertaing Bar Plot and Y Variable as a Fill"),
                                             plotOutput("barplot")),
                                    
                                    
                                    "Histograms",
                                    
                                    
                                    tabPanel(h4("Histogram"),
                                             h3("Histograms for Continuos Data"),
                                             h5("Choose only x-Variable"),plotOutput("hist")),
                                    
                                    "Box Plots",
                                    
                                    
                                    tabPanel(h4("Box Plots"),
                                             h3("Box plots"),
                                             h5("Choose X (Categorical Variable) and Y (Continuous Variable)"),plotOutput("beanplot"))
                                    
                        )))
             
             
             
  ))
