\name{elbowp}
\alias{elbowp}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Elbow method Plot
}
\description{
Plot used to determine number of clusters to be implemented in K-means algorithm.The Elbow method examines the within-cluster dissimilarity as a function of the number of clusters
}
\usage{
elbowp(data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
numeric matrix of data, or an object that can be coerced to such a matrix (such as a numeric vector or a data frame with all numeric columns).
}
}
\details{
One of the key decisions to be made when performing K-Means clustering is to decide on the numbers of clusters to use. In practice, there is no easy answer and it’s important to try different ways and numbers of clusters to decide which options is the most useful, applicable or interpretable solution.
How to decide on number of clusters:
With the Elbow method, the solution criterion value (within groups sum of squares) will tend to decrease substantially with each successive increase in the number of clusters. Simplistically, an optimal number of clusters is identified once a “kink” in the line plot is observed. As you can grasp, identifying the point in which a “kink” exists is not a very objective approach and is very prone to heuristic processes.
}
\value{
A plot is returned that shows number of clusters Vs Within groups sum of squares
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
function (data)
{
    wss <- (nrow(data[, (1:3)]) - 1) * sum(apply(data[, (1:3)],
        2, var))
    for (i in 2:15) wss[i] <- sum(kmeans(data[, (1:3)], centers = i)$withinss)
    plot(1:15, wss, type = "b", xlab = "Number of Clusters= 2 (Classification)",
        ylab = "Within groups sum of squares", main = "Assessing the Optimal Number of Clusters ",
        pch = 20, cex = 2, col = "coral")
    return(plot)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
