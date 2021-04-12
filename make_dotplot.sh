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

for genome in OKI2018_I69_1.0 Norway OSK42-1f AOM-5-1f O9-5f O3-3f B-2-1f
do
  sbatch -pshort mkDotPlot.py -y Oska$VERSION -x $genome --dotplot-options="--bed2=oskaV2.bed"
done
