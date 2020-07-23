if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("karyoploteR")

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene")

if (!require("BiocManager"))
  install.packages("BiocManager")
BiocManager::install("GenomicRanges")

library(karyoploteR)
library(GenomicRanges)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)

'''
# example from manual
txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene
txdba
all.genes <- genes(txdb)
all.genes
seqlengths(txdb)
head(all.genes)
kp <- plotKaryotype(genome="hg19")
kp <- kpPlotDensity(kp, all.genes)
write.csv(all.genes, file = "allgenes.csv")

'''

rcraft <- read.csv("./repeatcraft/chr12.rmerge.gff",header = FALSE, sep = "\t",skip=1)
TEs <- read.csv("guppyTEs.csv",header = FALSE, col.names=c("chr","start","end","width","strand","TE_classification"),sep = '\t')

TEdf <- data.frame(chr=TEs[,1],start=TEs[,2],end=TEs[,3],strand=TEs[,5])
guppy_TE <- makeGRangesFromDataFrame(TEdf)

kp <- plotKaryotype(genome=data.frame(c("chr1", "chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11","chr12","chr13","chr14","chr15","chr16","chr17","chr18","chr19","chr20","chr21","chr22","chr23"), c(34343053, 45373629,34494140,32745292,34046079,32826315,33249287,27016956,33240922,32921471,29172019,26605240,33504201,27818384,30184557,34948840,28869038,27716212,25553809,24586947,25956221,24441338,18095316)), plot.type=1, ideogram.plotter=kpAddCytobands, labels.plotter=kpAddChromosomeNames, chromosomes="chr12", zoom=NULL, cytobands=NULL, plot.params=NULL, use.cache=TRUE, main=NULL)
kpDataBackground(kp)
kpAxis(kp, ymin=0.00, ymax = 1.00, numticks = 5, cex=0.5, data.panel=2) 
kp <- kpPlotDensity(kp, guppy_TE)


#write.table(all.genes,"allgenes.csv",row.names=FALSE,col.names=TRUE,sep="\t")

data <- read.csv('Chr12.csv',header = TRUE, sep = "\t")
#kp <- plotKaryotype(genome="CHR12")
#kp <- kpPlotDensity(kp, all.genes)