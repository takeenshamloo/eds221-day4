rm(list = ls())

logistic_growth <- function(N0, K, r, time){
  Nt <- K / (1 + ((K - N0) / N0) * exp(-r * time))
  return(Nt)
}

logistic_growth(N0 = 100, K = 6000, r = 0.27, time = 40)

time_vec <- seq(0, 50, 0.1)

pop_1 <- logistic_growth(N0 = 100, K = 6000, r = 0.27, time = time_vec)

pop_1_vec <- vector(mode = "numeric", length = length(time_vec))

for (i in seq_along(time_vec)){
  population <- logistic_growth(N0 = 100, K = 6000, r = 0.27, time = time_vec[i])
  pop_1_vec[i] <- population
}

pop_time_1 <- data.frame(time_vec, pop_1_vec)
ggplot(pop_time_1, aes(x = time_vec, y = pop_1_vec)) +
  geom_line()

r_seq <- seq(0.2, 0.4, 0.01)

out_matrix <- matrix(nrow = length(time_vec), ncol = length(r_seq))

for (i in seq_along(r_seq)){
  for(j in seq_along(time_vec)){
    pop <- logistic_growth(N0 = 100, K = 6000, r = r_seq[i], time = time_vec[j])
    out_matrix[j, i] <- pop
  }
}

# Let's wrangling it a little bit 
out_df <- data.frame(out_matrix, time = time_vec) # Make it a data frame and add time

# Update the column names of out_df, keeping time column name the same
colnames(out_df) <- c(paste0("gr_", r_seq), "time")

# pivot_longer to make it tidy (you'll learn more about this next week)
out_df_long <- out_df %>% 
  pivot_longer(cols = -time, names_to = "growth_rate", values_to = "population")

# Then plot it: 
ggplot(data = out_df_long, aes(x = time, y = population)) +
  geom_line(aes(color = growth_rate)) +
  theme_minimal()