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

srun seqret @oskaV2.usa /work/LuscombeU/Oikopleura/Genomes/Oska$VERSION/Oska$VERSION.fa
srun indexGenome.py -g Oska$VERSION
cp ~/OSKA_superscaffolding/oskaV2.bed /work/LuscombeU/Oikopleura/Genomes/Oska$VERSION/

alignTo () {
  sbatch mkDotPlot.py -x Oska$VERSION -y $1 \
    --dotplot-options="--bed1=/work/LuscombeU/Oikopleura/Genomes/Oska$VERSION/oskaV2.bed"
}

for genome in I69-4 Norway OSK42-1f AOM-5-1f O9-5f O3-3f B-2-1f
do
  sbatch mkDotPlot.py -x Oska$VERSION -y $genome --dotplot-options="--bed1=/work/LuscombeU/Oikopleura/Genomes/Oska$VERSION/oskaV2.bed"
done
