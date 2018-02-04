\name{k3dplot}
\alias{k3dplot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
K- Means Cluster 3-D plot
}
\description{
Plotting a 3-D plot based on clusters formed using K-Means Algorithm
}
\usage{
k3dplot(data, k)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
numeric matrix of data, or an object that can be coerced to such a matrix (such as a numeric vector or a data frame with all numeric columns).
}
  \item{k}{
Number of clusters or centroids - k
}
}
\details{
The data is clustered by the k-means method, which aims to partition the points into k groups such that the sum of squares from points to the assigned cluster centres is minimized. At the minimum, all cluster centres are at the mean of their Voronoi sets (the set of data points which are nearest to the cluster centre). Finally the function outputs a plot in 3-D which uses plotly package.

}
\value{

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
function (data, k)
{
    kmn <- kmeans(data[, (1:3)], k, nstart = 30)
    a <- as.data.frame(kmn$centers)
    p1 <- plot_ly(a, x = ~age, y = ~height, z = ~weight, size = 15,
        sizes = c(1, 40), name = "Centroid", type = "scatter3d",
        mode = "markers", marker = list(color = "red"))
    p2 <- plot_ly(data, x = ~age, y = ~height, z = ~weight, name = "Clusters",
        color = ~kmn$cluster) \%>\% add_markers() \%>\% layout(scene = list(xaxis = list(title = "height"),
        yaxis = list(title = "weight"), zaxis = list(title = "age")))
    p3 <- subplot(p1, p2)
    return(p3)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
