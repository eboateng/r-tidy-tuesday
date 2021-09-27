library(waffle)
viz_waffles <- function(df){
  ggplot(df, aes(fill = variable, values = value)) +
    geom_waffle(n_rows = 8, size = 0.9, colour = "white") +
    scale_fill_manual(name = NULL,
                      values = c("#999999", "#FF9900"),
                      labels = c("Nominee", "Winner")) +
    coord_equal() +
    theme_void()+
    theme(legend.position="top")+
    facet_wrap(~year, nrow = 1, strip.position = "bottom")
}
