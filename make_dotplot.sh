#!/bin/sh -e
module use /work/LuscombeU/modules/.modulefiles
module load Oikopore
module load LAST
module load samtools
module load blast
module load emboss

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

VERSION=V15

mkdir /work/LuscombeU/Oikopleura/Genomes/Oska$VERSION

srun seqret @oskaV2.usa /work/LuscombeU/Oikopleura/Genomes/Oska$VERSION/oska$VERSION.fa
srun indexGenome.py -g Oska$VERSION

alignTo () {
  sbatch mkDotPlot.py -x Oska$VERSION -y $1 \
    --dotplot-options='--bed1=~/OSKA_superscaffolding/oskaV2.bed'
}

for genome in I69-4 Norway OSK42-1f AOM-5-1f O9-5f O3-3f B-2-1f

sbatch mkDotPlot.py -x Oska$VERSION -y O3-1f  --dotplot-options='--bed1=~/OSKA_superscaffolding/oskaV2.bed'
sbatch mkDotPlot.py -x Oska$VERSION -y I69-4  --dotplot-options='--bed1=~/OSKA_superscaffolding/oskaV2.bed'
sbatch mkDotPlot.py -x Oska$VERSION -y Norway  --dotplot-options='--bed1=~/OSKA_superscaffolding/oskaV2.bed'
sbatch mkDotPlot.py -x Oska$VERSION -y OSK42-1f  --dotplot-options='--bed1=~/OSKA_superscaffolding/oskaV2.bed'
sbatch mkDotPlot.py -x Oska$VERSION -y AOM-5-1f  --dotplot-options='--bed1=~/OSKA_superscaffolding/oskaV2.bed'


