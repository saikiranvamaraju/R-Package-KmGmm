\name{mclustp}
\alias{mclustp}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 Cluster 3-D plot
}
\description{
A plot for clusters formed based on The EM Algorithm for Gaussian Mixtures.
}
\usage{
mclustp(data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
numeric matrix of data, or an object that can be coerced to such a matrix (such as a numeric vector or a data frame with all numeric columns).
}
}
\details{
The data is clustered by the EM algorithm for Gaussian mixture models (GMM) using mclust package.The function returns a plot after taking the input data that is to be clustered and returns a plot showing a number of clusters in 3-D. The plot uses plotly package.
}
\value{
returns a plot
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
function (data)
{
    mc = Mclust(data[, (1:3)])
    plot(mc, what = c("classification"), dimens = c(1, 2))
    p1 <- plot_ly(data, x = ~age, y = ~height, z = ~weight, color = ~mc$classification) \%>\%
        add_markers()
    return(print(p1))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
