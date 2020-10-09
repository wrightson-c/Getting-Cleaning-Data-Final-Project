---
title: "CodeBook"
author: "Chris"
date: "10/9/2020"
output: html_document
---


# Getting and Clean Data - Final Project

This codebook explains the variables, data, and analytical transformations
performed on the wearable data provided for this project.

## Data

The original data, as well as a fuller description can be found at these two links:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

In brief, this data was collected from 30 participants who wore a Samsung device.
The device had a built in accelerometer and gyrometer which provided the raw
data.  This raw data when through specific time and frequency transformations
to arrive at a vector of acceleration and velocity features covering different
types of body movements.  This was the starting point for the present transformations.

## Transformations

In order to prepare this data for analyses, several steps were taken:

1. The .txt files provided at the above source were read into RStudio
2. Labels were given to the vectors of body activities and subject IDs
3. The provided feature names from the above source were applied to the columns of their measurements
4. The test and training samples of participants were combined into a single data set
5. Statistical measures beyond means and standard deviations (SDs) were removed
6. The names of the features were transformed to be more readable
7. After arriving at the data set created at the end of step #6, an additional data set was created that provided the means of each of the features for each participant's body movements

## Variables

There is a "Subject" variable which is a numeric variable uniquely identifying each participant.

There is an "Activity" variable which is a factor identifying one of 6 body movements: laying, sitting, standing, walking, walking_downstairs, and walking_upstairs.

There is a "Population" variable identifying if the participant was originally in the test or training group.

Finally, the remaining feature columns provide the different motion measurements according to their respective names (in the "combined" data set) and their means by each participant's separate body movement categories (in the "averages" data set).