#install.packages("tidyverse", dependencies = TRUE)
library(ggplot2)

chrOrder <- c(1:8)

for (x in chrOrder)
{
  data <- read.table(paste("counts_per_locus_chr",toString(x),".maf",sep=""), sep="\t", header=FALSE)
  names(data) <- c("locus", "count", "chr")

  #create plot
  snpDensity <- ggplot(data, aes(x = locus, y = count)) + geom_point() +
      facet_wrap(~ chr,ncol=2) + # seperate plots for each chr, x-scales can differ from chr to chr
      ggtitle (paste("# of mutated pts by locus, chromosome", toString(x), sep=" ")) +
      xlab ("Position in the genome") +
      ylab ("SNV/MNV/indel density")
  ggsave(plot = snpDensity, filename=paste("patients_per_position_chr_", toString(x), ".png", sep=""), path="/home/jimin/consensus_snv_indel/", height=5, width=5, units='in')

}
