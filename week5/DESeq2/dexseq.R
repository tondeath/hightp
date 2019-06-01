library(DESeq2)
library(tidyverse)
setwd("/home/nuttapong/Desktop/block4/hightp/week5/DESeq2")
ibd_design <- read_tsv("IBD_study_design.tab")
EM <- read.table("IBD_count_matrix.tab") %>% as.matrix
dds <- DESeqDataSetFromMatrix(countData = EM, # Count matrix
                              colData = ibd_design, # Study design
                              design = ~ Class) # Groups
dds <- DESeq(dds)
res <- results(dds)
res2 <- results(dds,
                contrast=c("Class", "UCa", "con"), # Comparison
                lfcThreshold=0.5, # logFC cutoff
                alpha=0.05) # p-value cutoff

summary(res2)

