#ui.R
library(plotly)

shinyUI(navbarPage( "Plan dashboard",theme="bootstrap1.css",
                    tabPanel("Portfolio extract" ,
                             sidebarLayout(position="right",
                                           sidebarPanel(
                                             actionButton("rs_dload_btn", "Download Protfolio Extract"),
                                             p('Click to Download the Resource Demand file from the Server'),
                                             hr(),
                                             selectInput("graphtype2", label ="Select the Graph to be Plotted", 
                                                         choices = c("Plan Demand"),
                                                         selected = "",
                                             #actionButton("read_file_btn", "Run extract"),
                                             hr(),
                                             sliderInput("hours", label = h6("FY17 Hours greater than"),
                                                         min = 0, max = 2000, value = 200),
                                             checkboxGroupInput("qtr", "FY17 quarters",
                                                                c("FY17" ="fy17",
                                                                  "Q1" = "q1",
                                                                  "Q2" = "q2",
                                                                  "Q3" = "q3",
                                                                  "Q4" = "q4"),
                                                                inline=FALSE,
                                                                selected=c("fy17","q1","q2","q3","q4"))
                                           ),
                                           mainPanel(
                                             
                                             fluidRow(
                                               column(12,img(src="scp1.png", height = 200, width = 400) )
                                             ),
                                             textOutput("filter2"),
                                             plotlyOutput("getprojectstatus")
                                             #DT::dataTableOutput('contents')
                                           ))
                    ),
                    tabPanel("CP- Utilization", 
                             sidebarLayout(position="right",
                                           sidebarPanel(
                                             actionButton("cp_dload_btn", "Download CP extract"),
                                             p('Click to Download the Time Logged file from the Server'),
                                             hr(),
                                             selectInput("graphtype", label ="Select the Graph to be Plotted", 
                                                         choices = c("Plan Utilization"="1",
                                                                     "FTE Utlization Per Manager"="2"),
                                                         selected = "1"),
                                             #actionButton("read_file_btn", "Run extract"),
                                             hr(),
                                             selectInput("mgr", label ="Filter By Manager", 
                                                         choices = c("NA"),
                                                         selected = "",
                                                         multiple = TRUE),
                                                        p('Click and Select for multiple options')
                                             #hr(),
                                             #checkboxGroupInput("qtr", "FY17 quarters",
                                            #                    c("FY17" ="fy17",
                                             #                     "Q1" = "q1",
                                            #                      "Q2" = "q2",
                                             #                     "Q3" = "q3",
                                            #                      "Q4" = "q4"),
                                            #                    inline=FALSE,
                                            #                    selected=c("fy17","q1","q2","q3","q4"))
                                           ),
                                           mainPanel(
                                             
                                             fluidRow(
                                                       column(12,img(src="scp1.png", height = 100, width = 400) )
                                                       ),
                                             textOutput("filter1"),
                                              #box(plotOutput("timeUtilizationByManager"), width=6, height=500)
                                             # box(plotlyOutput("timeUtilizationByManager"), width=6, height=500)
                                            plotlyOutput("timeUtilizationByManager")
                                           ))
                             
                    ),
                    navbarMenu("Others", 
                               tabPanel("Forecast", 
                                        sidebarLayout(position="right",
                                                      sidebarPanel(
                                                        fileInput('file2', 'Choose forecast file',
                                                                  accept=c('text/csv', 
                                                                           'text/comma-separated-values,text/plain', 
                                                                           '.csv'))
                                                      ),
                                                      mainPanel(
                                                        
                                                        fluidRow(
                                                          column(12,img(src="scp.png", height = 200, width = 400) )
                                                        ),
                                                        plotlyOutput("fcst1"),
                                                        DT::dataTableOutput('forecast')
                                                      ))
                                        
                                        
                               ))
                    
                    
))