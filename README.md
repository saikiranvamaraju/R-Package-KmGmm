# R-Package-KmGmm
Building a basic R package for displaying K-means and Gaussian Mixture models clustering for a specific dataset

Background
This package was specifically created for a small dataset just for understanding the process of building packages in R using functions.
It uses other packages along which include "devtools" for building R-package, "plotly" for visualization,
"caret" for classification metrics and "mclust" for clustering using GMM algorithm.

The package has following functionalities:
1. function that plots Age, Height and Weight in 3D color coded according to cluster(gender) along with centroid,
where the clusters are determined using Kmeans and K is provided by the user.
2. function that returns plot obtained by using K - Means elbow method to determine number of clusters
3. function that takes in the test data, assigns a cluster to each test data point (Age, Height and Weight). 
Consequently determines if the data point is a male or female depending on other data points in the cluster using K-Means algorithm.
Also provides accuracy, false positive and false negative rates.
4. function that plots Age, Height and Weight in 3D color coded according to cluster, where the clusters are determined using GMM.
5. function that takes in the test data, assigns a cluster to each test data point (Age, Height and Weight) using GMM algorithm. 
Consequently determines if the data point is a male or female depending on other data points in the cluster.
Also provides accuracy, false positive and false negative rates.
6. function that displays all the results mentioned above.
