#Author: M. Dereviankin
#Date: 26-June-2023
#Title: Isotopic Mixing Curves

# load ggplot2
library(ggplot2)
library(hrbrthemes)
library(tidyverse)
library(dplyr)
library(wesanderson)
library(RColorBrewer)
library(manipulate)
library(plotly)
library(shiny)
library(leaflet)
library(GGally)
library(tidymodels)
library(yardstick)

# Define end-member parameters 
C1 <- 0.5   # concentration of EM1
C2 <- 399   # concentration of EM2
δ1 <- 0.709071   # Isotopic ratio of EM1
δ2 <- 0.70791    # Isotopic ratio of EM2

# Linear Binary Mixing ----------------------------------------------------
# Define variables to store the mixing proportion and isotopic ratio data
percent_EM1 <- seq(from = 100, to = 0, by = -1)
mixing_proportions <- c(C1 * percent_EM1 / 100, C2)
Sr_ratio_linear <- c(δ1, δ1 - ((δ1 - δ2) * (1 - percent_EM1 / 100)))
Cm_values <- rep(NA, length(mixing_proportions))

# Calculate mixing proportions based on percent difference between endmembers
for (i in 1:length(mixing_proportions)){
  
  # Calculate mixing proportion
  Cm <- ((percent_EM1[i] / 100) * C1) + (((100 - percent_EM1[i]) / 100) * C2)
  
  # Assign calculated value to vector
  Cm_values[i] <- ifelse(Cm > 399, 399, Cm)
  
}

#Create a dataframe with results
df <- data.frame(mixing_proportions, Cm_values, Sr_ratio_linear)

#save CSV. Change name to be applicable for your file. 

write.csv(df, "Binary_linear_mixing.csv")

# Plot the results as a scatter plot with points

# Create ggplot.
#Make sure to change titles to be applicable to your study. 
binary_linear_plot <- 
  ggplot(df, aes(x = Cm_values, y = Sr_ratio_linear)) + 
  geom_point(color = "darkolivegreen", shape = 19, alpha = 0.75) +
  labs(x = "Concentration of mixture", 
       y = "Isotopic ratio",
       title = "Binary mixing curve for Concentration and isotope ratio") +
  scale_x_log10(limits = c(0.5, 399)) + 
  scale_y_continuous(limits = c(δ2, δ1)) + 
  theme_classic()

print(binary_linear_plot)

#save ggplot
# Save as PNG
ggsave("binary_linear_curve.png", plot = binary_linear_plot, width = 7, height = 5, units = "in", dpi = 600)

# Isotope Dependent Binary Mixing -----------------------------------------

# Define a range of proportions
proportions <- seq(0.1, 1, length.out = 101)

# Calculate the Sr ratio for each proportion
Sr_concentration_mix <- (C1 * proportions) + (C2 * (1 - proportions))

#calculate the mixing equation

Sr_iso_ratios <- (C1*C2*((δ2-δ1)))/(Sr_concentration_mix*(C1-C2))+((C1*δ1-C2*δ2))/(C1-C2)


#Create a dataframe with results

df_dependent <- data.frame(proportions, Sr_concentration_mix, Sr_iso_ratios)

#save CSV

write.csv(df_dependent, "Binary_Dependent_mixing.csv")

# Create the ggplot
binary_dependent_plot <- 
ggplot(df_dependent, aes(x=Sr_concentration_mix, y=Sr_iso_ratios)) +
  geom_point(size = 4, color = "darkolivegreen", alpha = 0.75) +
  scale_x_log10(limits = c(0.001, 1000), breaks = c(0.001, 0.01,  0.1, 1, 10, 100, 1000)) +
  labs(x = "Concentration (mg/L)",
       y = "ratio"),
       title = "Parabolic mixing curve") +
  theme_classic()

print(binary_dependent_plot)

#save ggplot
# Save as PNG
ggsave("binary_dependent_plot.png", plot = binary_dependent_plot, width = 7, height = 5, units = "in", dpi = 600)
