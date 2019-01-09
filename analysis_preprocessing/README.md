After sequencing:
  1. Trim sequences for gRNA sequences in a folder with all fastq files. (*perl trim_for_gRNA.pl*)
  
  2. Extract only the sequences (./seqonly) and tabulate all instances (./uniq). (*extract_tabulate.sh*)

  3. Load gRNA counts, visualize library, and output MAGeCK count table. (*generate_CountTable_media.ipynb*)
    * Outputs *count_table_media.txt* which can be input to MAGeCK
