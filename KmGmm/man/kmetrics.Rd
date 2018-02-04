\name{kmetrics}
\alias{kmetrics}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
K-Means Algorithm Metrics
}
\description{
A function used to assign a cluster to each test data
point and determines if the data point is a male or female depending on other data points in the cluster. Outputs metrics like Accuracy, false positive and false negative rates.
}
\usage{
kmetrics(testdata, traindata)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{testdata}{
A data frame used for testing a model. (confirmatory data set)
}
  \item{traindata}{
A data frame used for training a model.
}
}
\details{
The function kmetrics assigns a cluster to each data point in test dataset based on centers of clusters in training data. Then detects whether the data point is a male or female and evaluates the performance of the model using 3 metrics namely Accuracy, False Positive and False Negative rates.
}
\value{

 \item{Accuracy }{Total correcly classified data points among all the test data.}
 \item{False Positive Rate }{When it's actually no, how often does it predict yes}
  \item{False Negative Rate }{When it's actually Yes, how often does it predict no}

}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Sai Kiran Vamaraju
}
\note{
Only works on a specific dataset. Not Applicable for all kinds of data.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (testdata, traindata)
{
    clusters <- function(x, centers) {
        tmp <- sapply(seq_len(nrow(x)), function(i) apply(centers,
            1, function(v) sum((x[i, ] - v)^2)))
        max.col(-t(tmp))
    }
    kmn <- kmeans(traindata[, (1:3)], 2)
    b <- clusters(testdata[, (1:3)], kmn[["centers"]])
    testclus <- data.frame(testdata, b)
    testclus$b[testclus$b == 2] <- "Male"
    testclus$b[testclus$b == 1] <- "Female"
    cmo <- confusionMatrix(testclus$b, testclus$Gender)
    cm <- cmo$table
    acc <- sum(diag(cm))/sum(cm)
    fp <- cm[1, 2]/sum(cm[, 2])
    fn <- cm[2, 1]/sum(cm[, 1])
    ls <- list(Accuracy = acc, `False Positive` = fp, `False Negative` = fn)
    ls
    return(ls)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
