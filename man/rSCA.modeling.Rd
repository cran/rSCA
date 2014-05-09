\name{rSCA.modeling}
\alias{rSCA.modeling}
\alias{rSCA.modeling}

\title{
	Multivariate Modeling with Stepwise Cluster Analysis
}

\description{
	This function serves as a tool for modeling the relationships between dependent and independent variables. The modeling results are given by a clustered tree. The information for the clustered tree is saved into two text files: tree file (file name: tree_***.txt) and map file (file name: map_***.txt). The tree file stores the structure of the clustered tree, and the map file contains the detailed information of leaf clusters. There two files are usually generated at the current work directory. If the debug mode is enabled, a log file (file name: log_***.txt) will also be generated at the current work directory.
}

\usage{
	rSCA.modeling(alpha = 0.05, xfile, yfile, x.row.names = FALSE, 
        x.col.names = FALSE, y.row.names = FALSE, y.col.names = FALSE, 
        x.missing.flag = "NA", y.missing.flag = "NA", x.type = ".txt", 
        y.type = ".txt", mapvalue = "mean", GSS = FALSE, debug = FALSE)
}

\arguments{
	\item{alpha}{
		a given significance level for the clustering procedure. Default value is 0.05.
	}
	\item{xfile}{
		a string to specify the path to the data file of the independent variables (X), only supports files in two formats: *.txt or *.csv.
	}
	\item{yfile}{
		a string to specify the path to the data file of the dependent variables (Y), only supports files in two formats: *.txt or *.csv.
	}
	\item{x.row.names}{
		a logical value to specify if the independent (X) data file contains row names or not. Default value is FALSE. 
	}
	\item{x.col.names}{
		a logical value to specify if the independent (X) data file contains column names or not. Default value is FALSE. 
	}
	\item{y.row.names}{
		a logical value to specify if the dependent (Y) data file contains row names or not. Default value is FALSE. 
	}
	\item{y.col.names}{
		a logical value to specify if the dependent (Y) data file contains column names or not. Default value is FALSE. 
	}
	\item{x.missing.flag}{
		a string to specify the missing flag used in the independent (X) data file. Default value is "NA".
	}
	\item{y.missing.flag}{
		a string to specify the missing flag used in the dependent (Y) data file. Default value is "NA".
	}
	\item{x.type}{
		a string to specify the type of independent (X) data file. Default value is ".txt".
	}
	\item{y.type}{
		a string to specify the type of dependent (X) data file. Default value is ".txt".
	}
	\item{mapvalue}{
		a predefined string to specify how the information of leaf clusters will be stored in the map file. A full list of options for mapvalue includes: "mean", "max", "min", "median", "interval", "radius", "variation", and "random". Default value is "mean" which means only the sample means of the leaf clusters will saved into the map file. Similarly, the options of "max", "min", and "median" indicate the maximum, minimum, and median values of the leaf clusters will be stored into the map file, respectively. The other options allow users to obtain more information about the leaf clusters and thus to reflect a certain degree of uncertainty in the predicted results. For example, users can select the option of "interval" to obtain an interval (denoted as [min, max]) bounded by the minimum and maximum values of the leaf clusters. The option of "radius" will output the sample means and the corresponding radius which can be computed by (max-min)/2. The option of "variation" will output the sample means and the corresponding standard deviation. The option of "random" will save the information of the leaf clusters as an interval like the "interval" option, but it will pick up a number randomly within the interval and regard it as the predicted value of dependent variable in the inference or prediction process.
	}
	\item{GSS}{
		a logical value to specify if the Golden Section Search method will be used for seeking the best cutting point. Default value is FALSE. When the number of input samples and/or the number of independent variables are very large, the computation for determining the best cutting point will be very time-consuming. In that case, the Golden Section Search method is suggested for speeding up the seeking process of the best cutting point.
	}
	\item{debug}{
		a logical value to specify if the debug mode is enabled or not. Default value is FALSE. A log file will be created under your current work directory if debug model is enabled.
	}
}

\value{
	\item{treefile}{
		a string indicating the name of the tree file, e.g., tree_20140502_215627_139908
		9387068.79_3976.txt.
	}
	\item{mapfile}{
		a string indicating the name of the map file, e.g., map_20140502_215627_13990
		89387068.79_3976.txt.
	}
	\item{logfile}{
		a string indicating the name of the map file, e.g., log_20140502_215627_139908
		9387068.79_3976.txt. If the debug mode is disabled, the return value of logfile will be NA.
	}
	\item{type}{
		a string indicating how the information of leaf clusters will be stored. Generally, the \code{type} shares the same value as specified by the input parameter -- "mapvalue".
	}
	\item{totalNodes}{
		a number indicating how many clusters (including both intermediate and leaf clusters) are generated throughout the clustering procedure.
	}
	\item{leafNodes}{
		a number indicating how many leaf clusters are included in the ouput tree.
	}
	\item{cuttingActions}{
		a number indicating how many cutting actions are executed during the clustering procedure.
	}
	\item{mergingActions}{
		a number indicating how many merging actions are executed during the clustering procedure.
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

## Modeling with SCA: default parameters
myModel = rSCA.modeling(xfile = xdatafile, yfile = ydatafile, 
              x.col.names = TRUE, y.col.names = TRUE)

## Modeling with SCA: alpha = 0.1, with debug mode enabled
myModel = rSCA.modeling(alpha = 0.1, xfile = xdatafile, yfile = ydatafile, 
              x.col.names = TRUE, y.col.names = TRUE, debug = TRUE)
			  
## Modeling with SCA: alpha = 0.05, use interval for leaf nodes
myModel = rSCA.modeling(xfile = xdatafile, yfile = ydatafile, 
              x.col.names = TRUE, y.col.names = TRUE, mapvalue = "interval")
}
