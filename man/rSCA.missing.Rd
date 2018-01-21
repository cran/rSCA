\name{rSCA.missing}
\alias{rSCA.missing}
\alias{rSCA.missing}

\title{
	Checking Missing Values for Modeling Data Sets
}

\description{
	This function helps check if there are missing values in the modeling data sets. It prints out general statistics for missing values and their specific locations in the data matrix. It returns TRUE/FALSE to indicate whether the data file passes the missing check.
}

\usage{
	rSCA.missing(file, row.names = FALSE, col.names = FALSE, 
        missing.flag = "NA", type = ".txt")
}

\arguments{
	\item{file}{
		a string to specify the full filename of the data file, only supports files in *.txt or *.csv.
	}
	\item{row.names}{
		a logical value to specify if the data file contains row names or not. Default value is FALSE. 
	}
	\item{col.names}{
		a logical value to specify if the data file contains column names or not. Default value is FALSE. 
	}
	\item{missing.flag}{
		a string to specify the missing flag used in the data file. Default value is "NA".
	}
	\item{type}{
		a string to specify the type of data file. Default value is ".txt".
	}
}

\value{
	Return a logical value to indicate whether the data file contains missing value(s).
}

\author{
Xiuquan Wang  <xiuquan.wang@gmail.com>
}

\examples{
## Load rSCA package
library(rSCA)

## Case 1: without column name and row name, using NA as missing flag
data <- c("5 7 9 10\r",
          "12 3 4 5\r",
          "1 NA NA 3\r",
          "2 NA 13 23\r",
          "0 12 1 8\r",
          "NA 9 0 1\r")
datafile <- tempfile()
writeLines(data, datafile)
bPass = rSCA.missing(file = datafile)

## Remove temporary data files
unlink(datafile)


## Case 2: with column name and row name, using -99 as missing flag
data <- c("Year V1 V2 V3 V4\r",
          "2010 5 7 9 10\r",
          "2012 12 3 4 5\r",
          "2013 1 -99 -99 3\r",
          "2014 2 -99 13 23\r",
          "2015 0 12 1 8\r",
          "2016 -99 9 0 1\r")
datafile <- tempfile()
writeLines(data, datafile)
bPass = rSCA.missing(file = datafile, col.names = TRUE, 
            row.names = TRUE, missing.flag = "-99")

## Remove temporary data files
unlink(datafile)

## Case 3: with column name and row name, using NA as missing flag,
##         stored in comma-separated value (CSV) format.
data <- c("Year,V1,V2,V3,V4\r",
          "2010,5,7,9,10\r",
          "2012,12,3,4,5\r",
          "2013,1,NA,NA,3\r",
          "2014,2,NA,13,23\r",
          "2015,0,12,1,8\r",
          "2016,NA,9,0,1\r")
datafile <- tempfile()
writeLines(data, datafile)
bPass = rSCA.missing(file = datafile, col.names = TRUE, 
            row.names = TRUE, missing.flag = "NA", type = ".csv")

## Remove temporary data files
unlink(datafile)
}
