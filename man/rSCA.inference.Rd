\name{rSCA.inference}
\alias{rSCA.inference}
\alias{rSCA.inference}

\title{
	Inference for Stepwise Cluster Analysis
}

\description{
	This function is used for statistical inference or prediction based on an existing stepwise cluster analysis (SCA) model. The results are saved into a text file (file name: rsl_***.txt) at the current work directory.
}

\usage{
	rSCA.inference(xfile, x.row.names = FALSE, x.col.names = FALSE, 
        x.missing.flag = "NA", x.type = ".txt", model)
}

\arguments{
	\item{xfile}{
		a string to specify the file path to the new dataset of independent variables (X), only supports files in two formats: .txt or .csv.
	}
	\item{x.row.names}{
		a logical value to specify if the new data file contains row names or not. Default value is FALSE.
	}
	\item{x.col.names}{
		a logical value to specify if the new data file contains column names or not. Default value is FALSE. 
	}
	\item{x.missing.flag}{
		a string to specify the missing flag used in the new data file. Default value is "NA".
	}
	\item{x.type}{
		a string to specify the file type of the new dataset of independent variables. Default value is ".txt".
	}
	\item{model}{
		a model object to be used for statistical inference or prediction. This object is usually returned by the function of rSCA.modeling(). Users can also construct a new object themselves by assigning values to all attributes of a list object as defined in rSCA.modeling(). 
	}
}

\references{
Wang, Xiuquan, Guohe Huang, Qianguo Lin, Xianghui Nie, Guanhui Cheng, Yurui Fan, Zhong Li, Yao Yao, and Meiqin Suo (2013). A stepwise cluster analysis approach for downscaled climate projection - A Canadian case study. Environmental Modelling & Software, 49: 141-151.

Huang, Guohe (1992). A stepwise cluster analysis method for predicting air quality in an urban environment. Atmospheric Environment (Part B. Urban Atmosphere), 26(3): 349-357.

Liu, Y. Y. and Y. L. Wang (1979). Application of stepwise cluster analysis in medical research. Scientia Sinica, 22(9): 1082-1094.
}

\author{
Xiuquan Wang  <xiuquan.wang@gmail.com>
}

\examples{
## Load rSCA package
library(rSCA)

## X data file
xdata <- c("A B C D\r", "0.095 0.044 39.9 27\r", 
           "0.810 0.058 9.1 8\r", "0.101 0.077 11.4 14\r",
           "0.006 0.141 20.5 29\r", "0.070 0.281 27.3 26\r",
           "0.481 0.514 30.2 48\r", "0.120 0.286 36.4 39\r",
           "0.480 0.199 40.9 27\r", "0.112 0.101 29.9 18\r",
           "0.026 0.203 48.1 28\r", "0.128 1.235 48.2 61\r",
           "2.681 0.439 51.1 98\r", "1.601 0.333 56.1 99\r",
           "1.398 0.455 19.3 103\r", "1.256 0.314 14.9 17\r",
           "2.618 0.609 9.1 19\r", "1.217 0.880 17.2 73\r",
           "1.411 2.115 19.6 203\r", "0.245 6.839 49.2 296\r",
           "0.724 3.060 17.1 192\r", "0.019 2.252 29.1 123\r",
           "1.321 5.730 41.1 288\r", "0.903 3.078 39.0 97\r",
           "0.714 1.013 16.7 5\r", "0.581 1.398 11.7 57\r",
           "0.080 1.734 10.2 52\r", "0.120 1.848 6.6 132\r",
           "0.089 1.357 10.3 148\r", "0.112 0.585 19.3 79\r",
           "0.192 0.675 6.9 39\r", "0.301 1.937 11.9 6\r")
xdatafile <- tempfile()
writeLines(xdata, xdatafile)

## Y data file
ydata <- c("Y1 Y2 Y3\r", "0.020 0.034 10.01\r",
           "0.011 0.011 6.92\r", "0.016 0.018 9.53\r",
           "0.022 0.018 5.04\r", "0.031 0.029 8.90\r",
           "0.057 0.036 9.98\r", "0.040 0.048 12.96\r",
           "0.061 0.050 9.84\r", "0.023 0.031 8.84\r",
           "0.025 0.020 4.66\r", "0.041 0.042 9.02\r",
           "0.070 0.029 11.37\r", "0.077 0.022 11.88\r",
           "0.105 0.038 11.06\r", "0.038 0.027 11.64\r",
           "0.058 0.019 8.25\r", "0.051 0.050 10.01\r",
           "0.073 0.038 9.20\r", "0.123 0.080 9.91\r",
           "0.089 0.046 9.37\r", "0.073 0.039 7.99\r",
           "0.139 0.069 13.28\r", "0.095 0.048 9.80\r",
           "0.034 0.040 8.50\r", "0.055 0.034 9.21\r",
           "0.020 0.050 8.67\r", "0.070 0.036 8.03\r",
           "0.058 0.039 8.01\r", "0.057 0.031 6.30\r",
           "0.050 0.014 7.92\r", "0.039 0.040 8.08\r")
ydatafile <- tempfile()
writeLines(ydata, ydatafile)

## Modeling the relationship between Y and X with SCA
myModel = rSCA.modeling(xfile = xdatafile, yfile = ydatafile,
              x.col.names = TRUE, y.col.names = TRUE)

## New X data
xnewdata <- c("A B C D\r", "0.085 0.054 35.9 29\r", 
           "0.820 0.068 9.2 7\r", "0.121 0.067 12.4 13\r",
           "0.016 0.151 21.5 24\r", "0.075 0.283 25.3 16\r",
           "0.581 0.524 31.2 38\r", "0.130 0.486 33.4 36\r")
xnewdatafile <- tempfile()
writeLines(xnewdata, xnewdatafile)

## Predict Y with the SCA model
rSCA.inference(xfile = xnewdatafile, x.col.names = TRUE, model = myModel)

}
