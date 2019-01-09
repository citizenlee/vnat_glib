from Bio.Seq import Seq
from Bio.Alphabet import generic_dna
from Bio import SeqIO
import sys

#by default, we want to look for antisense strands for the gRNA
antisense = 1;

handle = open(sys.argv[1],'r')
#output antisense gRNAs for each CDS
num_gRNAs = 3
for record in SeqIO.parse(handle, "fasta") :
	curr_gRNAs = 0
	currSeq = str(record.seq)
	currSeqlen = len(record.seq)
	for index in range(len(currSeq)-23):
		currSubString = currSeq[index:index+23]
		rc_currSubString= Seq(currSubString).reverse_complement()
		if not antisense:
			rc_currSubString = currSubString
		if str(rc_currSubString[-2:]) == 'GG' and curr_gRNAs < num_gRNAs:
			percent = float(index)/float(currSeqlen)
			if(antisense):
				direction = "rc;"
			else:
				direction = "fw;"
			s = str(record.id) + ';' + str(direction) + repr(index) + ';' + repr(currSeqlen) + ';' + str(round(percent,5)) + ';' + str(rc_currSubString[:-3])
			print(s)
			curr_gRNAs += 1
handle.close()
