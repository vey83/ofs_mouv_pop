mar_cant <- function(data,selected_canton) {
  
  data_to_plot <- data %>%
    filter(canton == selected_canton)
  
  return(data_to_plot)
  
}
