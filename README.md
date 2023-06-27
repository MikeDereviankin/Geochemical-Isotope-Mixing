# Geochemical Isotope Mixing

## Summary

This repository contains R code to generate a binary mixing curve using dependent mixing proportions of different fluids. The mixing curve is plotted using the ggplot2 library, and the results are saved as a CSV file and a PNG image.

https://github.com/MikeDereviankin/Geochemical-Isotope-Mixing/assets/81693929/22b42705-88d6-4473-b021-5e1464b004d6

## License
This code is licensed under the MIT License.

## Dependencies
This code requires several R packages, which can be installed using the following commands:

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

# Introduction and Resources

The sources of science behind these two resources are the following:

1. Krubin, R. (2008). Binary Mixing. Retrieved from https://www.soest.hawaii.edu/krubin/GG325/lect39.pdf

2. Clark, I.D. (2015). Chapter 6: Mixing and Mass Balance, Stable Isotope Geochemistry. Retrieved from https://mysite.science.uottawa.ca/idclark/GEO4342/Ch6%20Mixing.pdf

The first source is a lecture by Dr. Ryan Krubin from the University of Hawaii titled "Binary Mixing". This lecture goes over the basics of binary mixing, including assumptions that are made when calculating mixing ratios between two end members. These assumptions include the idea that both end members are conserved throughout the mixture, that there are no chemical reactions that affect the isotopic ratios, and that there is no fractionation during mixing. The lecture then goes on to describe linear mixtures, which are often used in geology, geochemistry, and environmental science to determine the proportions of a particular material that came from two different sources. The lecture concludes with a summary of the importance of binary mixing in various science fields and the many applications that can be derived from stable isotopes and binary mixing.

The second source is Chapter 6 of a textbook titled "Stable Isotope Geochemistry" by Ian Clark. This chapter is titled "Mixing and Mass Balance" and covers isotopic mixing using stable isotopes. The chapter starts with an introduction to mass balance concepts and approaches to isotopic mixing calculations. Then, the mathematical relationships between the isotopic ratios of the mixed solution and the end members are covered in detail. The chapter further discusses the concept of isotope fractionation and how it can affect isotopic ratios during mixing. The chapter concludes by providing examples of various isotopic mixing scenarios and how they can be solved using the techniques described in the chapter.

In summary, both sources provide important insights into the underlying scientific concepts and principles that are used in the R code in this repository. These concepts include the assumptions made in binary mixing calculations, the mathematical relationships between the isotopic ratios of the mixed solution and the end members, and examples of real-world applications of binary mixing using stable isotopes.

# Linear Binary Mixing

- Define end-member parameters C1, C2, δ1, and δ2
- Define mixing proportions using seq() function
- Calculate mixing proportions and create a column for the calculated values using a for loop
- Create a data frame with three columns: mixing_proportions, Cm_values, and ratio_linear
- Save data frame as a CSV file
- Create a scatter plot of the data using ggplot2
- Create an interactive scatter plot for mixing_proporitons, Cm_values, and ratio_linear
- Save the plot as a PNG file

![binary_linear_curve](https://github.com/MikeDereviankin/Geochemical-Isotope-Mixing/assets/81693929/62f46f55-953e-4807-a2ea-c35734dbe8e9)

# Isotope Dependent Binary Mixing

- Define mixing proportions using seq() function
- Calculate strontium (Sr) ratio for each proportion
- Derive the mixing equation from the Sr ratio and end-member parameters
- Create a data frame with three columns: proportions, concentration_mix, and iso_ratios
- Save data frame as a CSV file
- Create a scatter plot of the data using ggplot2
- Create an interactive scatter plot for proportions, concentration_mix, and iso_ratios
- Save the plot as a PNG file

![binary_dependent_plot](https://github.com/MikeDereviankin/Geochemical-Isotope-Mixing/assets/81693929/182b0058-c81c-4836-ab52-542ca3398bf4)










 
