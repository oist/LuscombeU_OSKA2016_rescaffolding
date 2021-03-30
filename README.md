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

