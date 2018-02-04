\name{output}
\alias{output}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
K- Means & GMM results
}
\description{
A function that displays results obtained from KMeans and GMM.
}
\usage{
output(testdata, traindata, k)
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
Outputs metrics of K- Means and EM for GMM clustering methods.
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

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (testdata, traindata, k)
{
    o1 <- kmetrics(testdata, traindata)
    o2 <- pred.mclust(testdata, traindata)
    o3 <- print(paste("Package plotly was used since it was the best for 3D plotting among all the available options.\n                  The data can be scaled to obtrain better performance metrics"))
    return(c(o1, o2, o3))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
