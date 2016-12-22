Sys.setenv(HADOOP_CMD="/opt/hadoop/bin/hadoop")
Sys.setenv(HADOOP_HOME="/opt/hadoop")
Sys.setenv(HADOOP_STREAMING="/opt/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.7.3.jar")

#install.packages("/home/master/R/x86_64-pc-linux-gnu-library/3.3/rhdfs_1.0.8.tar.gz", repos=NULL, type="source")
#install.packages("/home/master/R/x86_64-pc-linux-gnu-library/3.3/rmr2_3.3.1.tar.gz", repos=NULL, type="source")
#install.packages("/home/master/R/x86_64-pc-linux-gnu-library/3.3/plyrmr_0.6.0.tar.gz", repos=NULL, type="source")
#install.packages("/home/master/R/x86_64-pc-linux-gnu-library/3.3/rhbase_1.2.1.tar.gz",repos=NULL, type="source")
#install.packages("/home/master/R/x86_64-pc-linux-gnu-library/3.3/ravro_1.0.4.tar.gz",repos=NULL, type="source")
library("rhdfs")
library("rmr2")
hdfs.init()

Sys.setenv(SPARK_HOME="/opt/spark")
.libPaths(c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib"), .libPaths()))
Sys.setenv('SPARKR_SUBMIT_ARGS'='"--packages" "com.databricks:spark-csv_2.10:1.0.3" "sparkr-shell"')

library(SparkR)
sc <- sparkR.init(master="spark://MasterSys:7077",
sparkPackages="com.databricks:spark-csv_2.11:1.2.0")
sqlContext<- sparkRSQL.init(sc)

#nme<- hdfslist.files(path = "/afs/")
#fs<-system("/opt/hadoop/bin/hadoop dfs -stat '%n' /afs/*",intern = T)
#str(fs)

#for(i in 1:length(nme1))
#{
#  assign(paste("df",i),hdfs.read(paste0(nme1[i],sep="/",eval(parse(text =nme1[i])))))
#}

#files<- hdfslist.files("/afs/*.csv")
#files<-as.data.frame(files$file)
#for(i in 1:30)
#{
#  assign("df",i,hdfs.read(files[i]))
#}


#data<-read.df(file.path('','afs','D001003.csv'))

#nme<- hdfslist.files(path = "/afs/")
#nme<-as.data.frame(nme$file)
#fs<-system("/opt/hadoop/bin/hadoop dfs -stat '%n' /afs/*",intern = T)
#fs<-as.list(fs)
#for(i in 1:length(fs))
#{
#  assign(paste("df",i),read.csv(paste0(eval(parse(file = file.path('','afs',fs[[i]]))))))
#}
