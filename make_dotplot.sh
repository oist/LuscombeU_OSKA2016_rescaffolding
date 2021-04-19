#!/bin/sh -e
ml use /apps/unit/LuscombeU/.modulefiles/
ml Oikopore
ml LAST
ml samtools
ml ncbi-blast
ml emboss

mkLenghts () {
  infoseq @$1.usa -length -name -only -nohead -filter > $1.lengths.txt
  python bed_file_generator.py $1 $1.lengths.txt >> oskaV2.bed
}

mkFASTA () {
  union @$1.usa $1.fa
  sed -i "1s/.*/>$1/" $1.fa
}

rm -f oskaV2.bed

for chr in Chr1 Chr2 PAR XSR YSR
do
  mkLenghts $chr
  mkFASTA   $chr
done

VERSION=V16

srun -pshort seqret @oskaV2.usa Oska$VERSION.fa

GENOMEFILE=$(pwd)/Oska$VERSION.fa
BEDFILE=$(pwd)/oskaV2.bed
ALIGNSCRIPT=$(pwd)/pairGenomeAlign.sh
INDEXDIR=/bucket/LuscombeU/common/Oikopleura/Genomes/
# cd /flash/....
GENOME=OKI2018_I69_1.0
#Or OKI2018_I69_1.0 Norway OSK42-1f AOM-5-1f O9-5f O3-3f B-2-1f
sbatch -pcompute -c 8 --mem 1G $ALIGNSCRIPT $INDEXDIR/$GENOME/$GENOME $GENOMEFILE $BEDFILE
