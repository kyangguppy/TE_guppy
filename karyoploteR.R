if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("karyoploteR")

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene")

library(karyoploteR)

library(TxDb.Hsapiens.UCSC.hg19.knownGene)
txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene
txdb
all.genes <- genes(txdb)
all.genes
seqlengths(txdb)
head(all.genes)
kp <- plotKaryotype(genome="hg19")
kp <- kpPlotDensity(kp, all.genes)

rcraft <- read.csv("./repeatcraft/chr12.rmerge.gff",header = FALSE, sep = "\t",skip=1)

#guppy <- getGenomeAndMask(genome=data.frame(c("CHR1", "CHR2","CHR3","CHR4","CHR5","CHR6","CHR7","CHR8","CHR9","CHR10","CHR11","CHR12","CHR13","CHR14","CHR15","CHR16","CHR17","CHR18","CHR19","CHR20","CHR21","CHR22","CHR23"), c(34343053, 45373629,34494140,32745292,34046079,32826315,33249287,27016956,33240922,32921471,29172019,26605240,33504201,27818384,30184557,34948840,28869038,27716212,25553809,24586947,25956221,24441338,18095316)), mask=NA)
#plotKaryotype(genome="guppy", plot.type=1, ideogram.plotter=kpAddCytobands, labels.plotter=kpAddChromosomeNames, chromosomes="auto", zoom=NULL, cytobands=NULL, plot.params=NULL, use.cache=TRUE, main=NULL)


write.table(all.genes,"allgenes.csv",row.names=FALSE,col.names=TRUE,sep="\t")

data <- read.csv('Chr12.csv',header = TRUE, sep = "\t")
#kp <- plotKaryotype(genome="CHR12")
#kp <- kpPlotDensity(kp, all.genes)