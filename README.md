Superscaffolding of the OSKA2016 genome
=======================================

X-specific region
-----------------

This region is easy to assemble with Nanopore sequences from males as they have
only a single copy of it.

Pairwise alignments to assemblies of the O9, O3, OSK42 and AOM-5 all support
the following arrangement:

    XSR: S10+, S9+, S32+, S84-, S59+, S8-, S1+

Some assemblies have telomeric sequences at the beginning of their XSR contig
before the matches with S10.

Inspection of the assembly graph suggest that the other end of the XSR contigs
in Flye assemblies is followed by the rDNA region, which we know is at the
beginning of the pseudo-autosomal region on the short arm of the pseudo-autosomal
chromosome.

Attempts to incorporate smaller OSKA2016 scaffolds only leads to discrepancies
of support from Flye assembly.

Thus, the XSR superscaffold above appears to be the best we can produce, and is
properly oriented.


Y-specific region
-----------------

It appears that this regions accumulates variations at such a fast rate that O9
and O3 do not fully agree on how to rescaffold OSKA2016, and OSK42 and AOM
individuals are clearly different.

Let's arbitrarly use O3-3f as a reference for superscaffolding now.  This is the
individual that was used in the OSKA2016 genome paper.  O3-3f's contig_4
starts with a telomere sequence, suggesting it is properly oriented.

    YSR: S63-, S71-, S68-, S48-, S55+, S42-, S65-, S87+, S86+, S78+, S110+, S62+, S39+, S26+, S47+, S64-


Pseudo-autosomal region
-----------------------

### Short arm (provisional)

Orientation unknown, probably contains errors, and original scaffolds also probably
contain misassemblies.

S29+, S49-, S33+, S80-, S119+, S93+, S43+, S128+, S83+, S57-, S56+, S45+, S117-, S88+, S92-, S21+, S12+, S79+, S89+, S53+, S54-, S11-, S74+, S25-



### Long arm:

S13 matches telomeric contigs in assemblies and is colinear to S70 and S52.

 - S2-, S18+, S73-, S23+, S52-, S70-, S13-

Chr1
----

### Short arm

S31 matches a contig starting with a telomere, and belongs to the short arm.

Let's assume that chr1 starts with:

   chr1_1: S31-, S51-, S38-, S85+, S61-, S44-, S109+, S37-

Then there is S6, with unkonwn orientation.  Therefore S6+ was arbitrarly chosen.

S36+ S76+ S58+ are associated with S6 with unknown confidence except that they are part
of this arm.  Added in arbitrary position.

Also, S28 belongs to this arm, but is not well aligning to the Nanopore assemblies
and I can not place it correctly.  Added arbitrarly between S37 and S36.

## Long arm

S3 matches a contig starting with a telomere.  But it also crosses a centromere
as it matches the left and right arm at the same time.  Unless it is a
missasembly.

There is good support that S5+ is followed by S7- but what is the orientation of the whole ?

Provisionally, let's use S6+ S3+ S5+ S7-
 

Chr2
----

Multiple Nanopore assemblies have a contig that starts (when properly oriented)
with a telomere and then matches S82.

    chr2 short arm: S82-, S30+, S15-, S50-, S41+, S17+, S16-, S20+

Luckily, O33f's scaffold 2 is the whole long arm of Chr2.
And S4's tail aligns to a contig ending with a telomere !
Dead end on the other side.

    chr2 long arm: S14-, S90-, S22-, S35+, S118+, S46+, S102-, S72-, S104+, S40+, S27+, S75-, S24-, S19+, S101+, S4-

## Controls

```
# No contig of OSKA2016.usa is not found in oskaV2
grep OSKA201 XSR.usa YSR.usa PAR.usa Chr1.usa Chr2.usa oskaV2.usa | sed -e 's/\[.*//g' -e 's/.*fasta//g' -e 's/$/(\[::r])?$/' | grep -Evf - OSKA2016.usa

# No contig of OSKA2016.usa is not used in oskaV2
cat OSKA2016.usa | sed -e 's/\[.*//g' -e 's/.*fasta//g' -e 's/$/(\[::r])?$/' | grep -Evf -  XSR.usa YSR.usa PAR.usa Chr1.usa Chr2.usa oskaV2.usa

# Check that no contig is used twice !

```
