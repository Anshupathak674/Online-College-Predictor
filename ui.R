#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # App title ----
    titlePanel("College Admittance Predictor"),
    
    # Sidebar layout with input and output definitions ----
    sidebarLayout(
        
        # Sidebar to demonstrate various slider options ----
        sidebarPanel(
            
            # Input: Simple integer interval ----
            sliderInput("GRE", "GRE Score:",
                        min = 0, max = 340,
                        value = 200,step = 1),
            
            # Input: Decimal interval with step value ----
            sliderInput("TOEFL", "TOEFL Score:",
                        min = 0, max = 120,
                        value = 80, step = 1),
            
            # Input: Specification of range within an interval ----
            sliderInput("CGPA", "CGPA:",
                        min = 0, max = 10,
                        value = 8,step = 0.1)
            
        ),
        
        # Main panel for displaying outputs ----
        mainPanel(
            
            # Output: Table summarizing the values entered ----
            tableOutput("values")
            
        )
    )
)