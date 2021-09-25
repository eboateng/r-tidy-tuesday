datefilter <- function(df, sbyear) {
  res <- df
  if (!('All' %in% sbyear)) {
    res <- df %>% filter(year %in% sbyear)
  }
  return (res)
}


distributorfilter <- function(df, sbdistributor) {
  res <- df
  if (!('All' %in% sbdistributor)) {
    res <- df %>% filter(distributor %in% sbdistributor)
  }
  return (res)
}


showfilter <- function(df, sbshow) {
  res <- df
  if (!('All' %in% sbshow)) {
    res <- df %>% filter(title %in% sbshow)
  }
  return (res)
}

# Apply All filters to the dataset
applyfilters <- function(df, sbyear, sbdistributor, sbshow) {
  resYear <- datefilter(df, sbyear)
  resDist <- distributorfilter(resYear, sbdistributor)
  resShow <- showfilter(resDist, sbshow)
  return (resShow)
}

### Filter functionality ###
checkFilters <- function(filterInput, session, id, defaultChoices){
  # filterInput: What kind of input needs to be checked?
  # Multifilters:
  #   State0: ALL checked.
  #   State1: I check something that isn't ALL -> Then I deactivate ALL
  #   State2: I check ALL -> then I deactivate everycheck
  
  # State0:
  choicesFilter <- c('All', defaultChoices)
  selectedChoice <- filterInput
  
  # State1:
  if((filterInput[1]=='All')&(length(filterInput)>1)){
    choicesFilter <- c('All', filterInput[filterInput!='All'])
    selectedChoice <- filterInput[filterInput!='All']
    
  }
  
  # State2:
  if((filterInput[1]!='All')&('All' %in% filterInput)){
    choicesFilter <- c('All', filterInput[filterInput!='All'])
    selectedChoice <- 'All'
  }
  
  updateSelectizeInput(session = session, inputId = id, selected = selectedChoice, choices =choicesFilter)
}

