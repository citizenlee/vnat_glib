
To produce a list of gRNAs for Sp-Cas9 or Sp-dCas9 (with 'NGG' PAM motif), extract a nucleotide FASTA file, '691.12.fna' for each protein-encoding gene in V. natriegens, and input into the script, 'parse_gRNAs_Vnat.py'.

```bash
$ python parse_gRNAs_Vnat.py 691.12.fna
```

Example output in 6 columns:
1. Gene identifier
2. Orientation (rc = reverse complement)
3. Start bp within ORF 
4. ORF length
5. Position of gRNA start within ORF as a fraction of ORF length
6. gRNA sequence

```bash
FIG|691.12.PEG.1;rc;18;1341;0.01342;AGGCTTGGCAACTGTTCGAA
FIG|691.12.PEG.1;rc;33;1341;0.02461;TCAGGATTTACTGCGAGGCT
FIG|691.12.PEG.1;rc;38;1341;0.02834;AGTCCTCAGGATTTACTGCG
FIG|691.12.PEG.2;rc;9;459;0.01961;ACTTCTATGATTAATGAGTT
FIG|691.12.PEG.2;rc;39;459;0.08497;TTAATGAGAGGAAGCTTGAT
FIG|691.12.PEG.2;rc;40;459;0.08715;CTTAATGAGAGGAAGCTTGA
FIG|691.12.PEG.3;rc;23;1044;0.02203;CAAAAGTGTGATAAGCCTTA
FIG|691.12.PEG.3;rc;73;1044;0.06992;ATCGTCAACAGACTCAACGA
FIG|691.12.PEG.3;rc;117;1044;0.11207;TTAGGTAAGCTTTTGAAAGC
FIG|691.12.PEG.4;rc;32;966;0.03313;CGCCATCACTGAGTGTTTTC
```

Resulting gRNA sequences should be checked for duplications, which can easily be done by extracting sequences with awk, sort, and uniq.

The gRNA library sequences are in 'CDSrc_guides.cleaned.csv'. The distribution of these guides along an ORF can be visualized in the Jupyter notebook, 'visualize_gRNA_distribution.ipynb". 
