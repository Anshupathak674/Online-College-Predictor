#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
install.packages("shiny")
library(shiny)
server <- function(input, output)
{
    # Reactive expression to create data frame of all input values ----
    sliderValues <- reactive({
        
        
        
        library(tidyverse)
        
        Data <- read.csv(file = 'C:/Users/Dell/Desktop/college_predictor.csv')
        
        (head(Data))
        Data <- na.omit(Data)
        model <- lm(Chance.of.Admit ~ GRE.Score + TOEFL.Score + CGPA, data = Data)
        
        summary(model)
        
        summary(model)$coefficient
        
        intercept <- coef(model)[1]
        
        print(intercept)
        
        Coeff_GRE <- coef(model)[2]
        
        Coeff_TOEFL <- coef(model)[3]
        
        Coeff_CGPA <- coef(model)[4]
        
        print(Coeff_GRE)
        
        print(Coeff_TOEFL)
        
        print(Coeff_CGPA)
        
        GRE_Score=as.double(input$GRE); 
        
        TOEFL_Score=as.double(input$TOEFL); 
        
        CGPA_Score=as.double(input$CGPA); 
        
        Chance_of_Admission = intercept+Coeff_GRE*GRE_Score+Coeff_TOEFL*TOEFL_Score+Coeff_CGPA*CGPA_Score
        Chance_of_Admission=max(0,Chance_of_Admission);
        Chance_of_Admission=min(1,Chance_of_Admission);
        print("The chance is   ")
        print(Chance_of_Admission)
        data.frame(
            Name = c("TOEFL Score",
                     "GRE Score",
                     "CGPA Score",
                     "Chance Of Admiision"
            ),
            Value = as.character(c(input$TOEFL,
                                   input$GRE,
                                   input$CGPA,
                                   Chance_of_Admission
            )),
            stringsAsFactors = FALSE)
        
    })
    
    # Show the values in an HTML table ----
    output$values <- renderTable({
        sliderValues()
    })
    
}