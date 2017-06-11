# Load the Shiny package
library(shiny)
library(ggplot2)

# Prepare the data
data(mtcars)
mtcars$am <- factor(mtcars$am, labels = c('Automatic','Manual'))
mtcars$carb <- factor(mtcars$carb)

# Create the Shiny user interface.
shinyUI(fluidPage(
    
    # Application title
    titlePanel("How different characteristics drive mpg"),
    
    # Sidebar with a selector input
    sidebarLayout(
        sidebarPanel(
            selectInput("variable", "Variable:",
                        list("Carburetors" = "carb",
                             "Transmission" = "am",
                             "Gears" = "gear")),
            checkboxInput("outliers","Show outliers",FALSE)
        ),
        
        # Show a box plot of the distribution in a box plot along with a
        # scatterplot.
        mainPanel(
            h3(textOutput("title")),
            plotOutput("Boxplot"),
            plotOutput("Scatterplot")
        )
    )
))