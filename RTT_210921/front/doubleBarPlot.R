viz_dbar <- function(df, xaxis1, xaxis2, yaxis, xname1, xname2) {
  
  
  fig <- plot_ly(
    df,
    x = xaxis1,
    y = yaxis,
    type = 'bar',
    text=xaxis1,
    textposition='auto',
    orientation = 'h',
    name = xname1,
    marker = list(
      color = 'rgba(153, 153, 153, 0.6)',
      line = list(color = 'rgba(153, 153, 153, 1.0)', width = 3)
    )
  )
  t <- list(
    size = 12,
    family='Nunito'
   )
  
  fig <- fig %>% add_trace(
    x = xaxis2,
    name = xname2,
    text=xaxis2,
    textposition='auto',
    marker = list(
      color = 'rgba(255, 153, 0, 0.6)',
      line = list(color = 'rgba(255, 153, 0, 1.0)', width = 3)
    )
  )
  
  fig <- fig %>% layout(
    barmode = 'stack',
    plot_bgcolor='rgb(0, 0, 0, 0)',
    paper_bgcolor='rgb(0, 0, 0, 0)',
    xaxis = list(title = "Nominee and Winners", showgrid = F),
    yaxis = list(categoryorder = "array",
                 categoryarray = yaxis,
                 ticksuffix = " ",
                 showgrid = F
                 ),
    legend = list(bgcolor = 'rgba(0, 0, 0, 0)'),
    font=t,
    width = 500, height = 300
    
    
  )
  
  
  return (fig)
}