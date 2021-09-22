datefilter <- function(df, sbyear) {
  res <- df
  if (sbyear != 'All') {
    res <- df %>% filter(year == sbyear)
  }
  return (res)
}


distributorfilter <- function(df, sbdistributor) {
  res <- df
  
  if (sbdistributor != 'All') {
    res <- df %>% filter(distributor == sbdistributor)
  }
  return (res)
}


showfilter <- function(df, sbshow) {
  res <- df
  if (sbshow != 'All') {
    res <- df %>% filter(show == sbshow)
  }
  return (res)
}

applyfilters <- function(df, sbyear, sbdistributor, sbshow) {
  resYear <- datefilter(df, sbyear)
  resDist <- distributorfilter(resYear, sbdistributor)
  resShow <- showfilter(resDist, sbshow)
  return (resShow)
}