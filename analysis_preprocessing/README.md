After sequencing:
  1. Trim sequences for gRNA sequences in a folder with all fastq files. (*perl trim_for_gRNA.pl*)
  
  2. Extract only the sequences (./seqonly) and tabulate all instances (./uniq). (*extract_tabulate.sh*)

  3. Load gRNA counts, visualize replicates, and output normalized count table. (*generate_CountTable_media.ipynb* or *generate_CountTable_passaging.ipynb*)
  
  4. *count_table_media.txt* or *count_table_passaging.txt* (unzip the included version) is then input to MAGeCK mle
