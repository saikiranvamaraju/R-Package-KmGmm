
# Required Packages
library(plotly)
library("magrittr")
library(caret)
library(mclust)

#funtions

#1 K- Means 3D plot
k3dplot<- function(data,k) {
  kmn<-kmeans(data[,(1:3)],k,nstart=30)
  a<-as.data.frame(kmn$centers)
  p1 <- plot_ly(a, x=~age, y=~height, z=~weight, size= 15,sizes=c(1, 40), name="Centroid", type = 'scatter3d',
                mode = "markers", marker = list(color = "red"))
  p2 <- plot_ly(data, x=~age, y=~height, z=~weight, name="Clusters", color=~kmn$cluster) %>%
    add_markers()%>%
    layout(scene = list(xaxis = list(title = 'height'),
                        yaxis = list(title = 'weight'),
                        zaxis = list(title = 'age')))

  p3<-subplot(p1,p2)
  return(p3)
}

#2 K - Means elbow method to determine number of clusters
elbowp<- function(data){

  wss <- (nrow(data[,(1:3)])-1)*sum(apply(data[,(1:3)],2,var))
  for (i in 2:15) wss[i] <- sum(kmeans(data[,(1:3)],
                                       centers=i)$withinss)

  plot(1:15, wss, type="b", xlab="Number of Clusters= 2 (Classification)",
       ylab="Within groups sum of squares",
       main="Assessing the Optimal Number of Clusters ",
       pch=20, cex=2,col="coral")

  return(plot)
}

#3 funtion for test data and metrics

kmetrics <- function(testdata,traindata) {

  clusters <- function(x, centers) {
    # compute squared euclidean distance from each sample to each cluster center
    tmp <- sapply(seq_len(nrow(x)),
                  function(i) apply(centers, 1,
                                    function(v) sum((x[i, ]-v)^2)))
    max.col(-t(tmp))  # find index of min distance
  }

  kmn<-kmeans(traindata[,(1:3)],2)
  b<-clusters(testdata[,(1:3)], kmn[["centers"]])

  testclus<- data.frame(testdata,b)
  testclus$b[testclus$b==2] <- "Male"
  testclus$b[testclus$b==1] <- "Female"
  cmo<-confusionMatrix(testclus$b,testclus$Gender)
  cm<-cmo$table
  acc<-sum(diag(cm))/sum(cm)

  fp<-cm[1,2]/sum(cm[,2])
  fn<-cm[2,1]/sum(cm[,1])
  ls<-list("Accuracy" = acc,"False Positive"= fp, "False Negative"= fn)
  ls
  return(ls)
}



################ Applying mclust ##########

mclustp<-function(data){
  mc = Mclust(data[,(1:3)])
  plot(mc, what=c("classification"), dimens=c(1,2))
  p1<- plot_ly(data, x=~age, y=~height, z=~weight, color=~mc$classification) %>%
    add_markers()
  return(print(p1))

}

#2

pred.mclust<-function(testdata,traindata){
  mc = Mclust(traindata[,(1:3)],G=2)
  tc<-predict.Mclust(mc,testdata[,1:3])
  clustert<-data.frame(testdata,tc)

  clustert$classification[clustert$classification==1] <- "Female"
  clustert$classification[clustert$classification==2] <- "Male"

  cmo<-confusionMatrix(clustert$classification,clustert$Gender)
  cm<-cmo$table
  acc<-sum(diag(cm))/sum(cm)

  fp<-cm[1,2]/sum(cm[,2])
  fn<-cm[2,1]/sum(cm[,1])

  ls<-list("Accuracy" = acc,"False Positive"= fp, "False Negative"= fn)
  return(ls)
}

output<-function(testdata,traindata){

  o1<-print(paste("K-Means Metrics"))

  o2<-kmetrics(testdata,traindata)
  o3<-print(paste("M-clust Metrics"))

  o4<-pred.mclust(testdata,traindata)

  o5<-print(paste("Summary : As per results GMM works best for this dataset. But, generally clustering doesnt work well for classifcation problems.Package plotly was used since it was the best for 3D plotting among all the available options. Package Mclust was used for EM algorthm for GMM. The data can be scaled to obtain better performance metrics"))
  return(c(o1,o2,o3,o4,o5))
}


