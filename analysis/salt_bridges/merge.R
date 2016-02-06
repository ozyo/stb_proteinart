apo<-read.table(file="ELIC_saltbridge.txt")
cpz<-read.table(file="ELIC_CPZ_saltbridge.txt")
rownames(cpz)<-cpz$V1
rownames(apo)<-apo$V1
dt<-merge(cpz, apo, by=0, all=TRUE)[c(1,3,5)]
dt[is.na(dt)] <- 0
write.table(merged.txt,dt)
write.table(dt,row.names=FALSE,col.names=FALSE,file="merged.txt")