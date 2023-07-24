# Finding the best pair of glasses
This anlysis was done as a final project of the exam Statistical Methods for Data Science - II, with prof. Tardella.

## Description
This project involves an analysis of a dataset consisting of approval or rejection ratings for different pairs of glasses, provided by multiple raters (people). The data is in the form of a matrix of 45x11 observations, with some missing values. The primary goal of the analysis is to identify the strictest rater and determine the best pair of glasses.

## Modelling
The project uses two modeling approaches: the first model is a Beta model with independent Beta-distributed random variables representing the item quality and rater strictness. The second model is a Rasch model, an **item response analysis** model, where the item quality and rater strictness are modeled with normal distributions. In the Rasch model, the probability of approval of an item by a rater is computed using a logistic function.

The R Markdown document showcases the data visualization, modeling assumptions, goals, and the implementation of both the Beta and Rasch models using the **JAGS** software and its R interface. It also presents various diagnostic tools for checking model convergence, model comparison metrics like Bayes Factor and likelihood ratio, and frequentist comparison for the same dataset.

This GitHub repository contains the necessary data files, R scripts, and the R Markdown file to reproduce the analysis and results.
