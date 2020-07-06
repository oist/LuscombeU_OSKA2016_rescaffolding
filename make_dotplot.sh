#!/bin/sh -e
module use /work/LuscombeU/modules/.modulefiles
module load Oikopore
module load LAST
module load samtools
module load blast
module load emboss
infoseq @g1_V14.usa -length -name -only -nohead -filter > g1.lengths.txt
python bed_file_generator.py G1 g1.lengths.txt > oskaV14.bed
infoseq @g2_V14.usa -length -name -only -nohead -filter > g2.lengths.txt
python bed_file_generator.py G2 g2.lengths.txt >> oskaV14.bed
infoseq @g3_V14.usa -length -name -only -nohead -filter > g3.lengths.txt
python bed_file_generator.py G3 g3.lengths.txt >> oskaV14.bed
infoseq @g4_V14.usa -length -name -only -nohead -filter > g4.lengths.txt
python bed_file_generator.py G4 g4.lengths.txt >> oskaV14.bed
infoseq @g5_V14.usa -length -name -only -nohead -filter > g5.lengths.txt
python bed_file_generator.py G5 g5.lengths.txt >> oskaV14.bed
infoseq @g6_V14.usa -length -name -only -nohead -filter > g6.lengths.txt
python bed_file_generator.py G6 g6.lengths.txt >> oskaV14.bed
infoseq @g7_V14.usa -length -name -only -nohead -filter > g7.lengths.txt
python bed_file_generator.py G7 g7.lengths.txt >> oskaV14.bed
infoseq @g8_V14.usa -length -name -only -nohead -filter > g8.lengths.txt
python bed_file_generator.py G8 g8.lengths.txt >> oskaV14.bed
union @g1_V14.usa g1_V14.fa
union @g2_V14.usa g2_V14.fa
union @g3_V14.usa g3_V14.fa
union @g4_V14.usa g4_V14.fa
union @g5_V14.usa g5_V14.fa
union @g6_V14.usa g6_V14.fa
union @g7_V14.usa g7_V14.fa
union @g8_V14.usa g8_V14.fa
sed -i "1s/.*/>G1/" g1_V14.fa
sed -i "1s/.*/>G2/" g2_V14.fa
sed -i "1s/.*/>G3/" g3_V14.fa
sed -i "1s/.*/>G4/" g4_V14.fa
sed -i "1s/.*/>G5/" g5_V14.fa
sed -i "1s/.*/>G6/" g6_V14.fa
sed -i "1s/.*/>G7/" g7_V14.fa
sed -i "1s/.*/>G8/" g8_V14.fa
seqret @oskaV14.usa oskaV14.fa
mkdir /work/LuscombeU/Oikopleura/Genomes/OskaV14
cp /work/LuscombeU/Jan/oskaV14.fa /work/LuscombeU/Oikopleura/Genomes/OskaV14/OskaV14.fa
srun indexGenome.py -g OskaV14
sbatch mkDotPlot.py -x OskaV14 -y O9-3f  --dotplot-options='--bed1=/work/LuscombeU/Jan/oskaV14.bed'
sbatch mkDotPlot.py -x OskaV14 -y O3-1f  --dotplot-options='--bed1=/work/LuscombeU/Jan/oskaV14.bed'
sbatch mkDotPlot.py -x OskaV14 -y I69-4  --dotplot-options='--bed1=/work/LuscombeU/Jan/oskaV14.bed'
sbatch mkDotPlot.py -x OskaV14 -y Norway  --dotplot-options='--bed1=/work/LuscombeU/Jan/oskaV14.bed'
sbatch mkDotPlot.py -x OskaV14 -y AOM-5-1f  --dotplot-options='--bed1=/work/LuscombeU/Jan/oskaV14.bed'
sbatch mkDotPlot.py -x OskaV14 -y OSK42-1f  --dotplot-options='--bed1=/work/LuscombeU/Jan/oskaV14.bed'


