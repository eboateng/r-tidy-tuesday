
viz_waffles <- function(df){
  backgroundcolor <- "#ECF0F5"
  ggplot(df, aes(fill = variable, values = value)) +
    geom_waffle(n_rows = 8, colour = "white") +
    scale_fill_manual(name = NULL,
                      values = c("#999999", "#FF9900"),
                      labels = c("Nominee", "Winner")) +

    theme_void()+
    theme(
      legend.position = "top",
      plot.margin = margin(0,0,0,0),
      strip.background = element_rect(fill=backgroundcolor, color = backgroundcolor),
      panel.background = element_rect(fill = backgroundcolor, color = backgroundcolor),
      plot.background  =  element_rect(fill = backgroundcolor, color = backgroundcolor),
      )+
      facet_wrap(~year, nrow = 3, strip.position = "bottom")

}
