#!/bin/sh

indexFile=$1
genomeFile=$2
bedFile=$3

last-train -P0 --revsym --matsym --gapsym -E0.05 -C2 $indexFile $genomeFile > alignParamFile.txt
lastal -P0 -m50 -E0.05 -C2 -p alignParamFile.txt $indexFile $genomeFile > alignFile.maf
last-split alignFile.maf | maf-swap | last-split | maf-swap | last-postmask > alignFileEdited.maf
maf-convert tab -n alignFileEdited.maf > alignTabFile.txt
maf-convert gff -J 2e5 alignFileEdited.maf > alignGffFile.gff3
pigz --best alignFile.maf
last-dotplot -x 2000 -y 2000 --sort1=3 --sort2=1 --strands2=1 --rot1=v --rot2=h --bed2=$bedFile alignTabFile.txt dotplot.png
