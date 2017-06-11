# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    # Formula text is a reactive format to enable inteactivity.
    formula <- reactive({
        paste("mpg ~", input$variable)
    })
    
    # Return the formula to print as a title.
    output$title <- renderText({
        formula()
    })
    
    # Generate a boxplot based on the reactive input above.
    output$Boxplot <- renderPlot({
        boxplot(as.formula(formula()), 
                data = mtcars,
                outline = input$outliers)})
    
    # Generate a scatterplot based on the reactive input above.
    output$Scatterplot <- renderPlot({
        ggplot(data = mtcars, aes(x = as.factor(mtcars[,input$variable]), y = mtcars$mpg)) +
            geom_point(shape = 16, size = 3) +
            theme_bw() +
            theme(axis.title.x=element_blank(),
                  axis.title.y=element_blank())
            
    })
})