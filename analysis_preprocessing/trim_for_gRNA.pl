# will trim all fastq files for the promoter (defined in $p5adapter) and start of the gRNA scaffold (defined in $p7adapter)
# requires cutadapt (https://cutadapt.readthedocs.io/en/stable/installation.html) 
# sequences without the promoter or the beginning of gRNA scaffold are discarded
# outputs a trimmed file which appends .trimmed to incoming filename and summary table with 3 columns: 
# 	1. file name
#	2. number of sequences pre-filter
#	3. number of sequences post-filter 

@files = glob("*.fastq");

$quality = 22;
$p7adapter = "GTTTTAGAGCT";
$p5adapter = "AAGCTTGATATCTTGACGGCTAGCTCAGTCCTAGGTACAGTGCTAGC";
$error = 0.1;

%prefilter=();
%postfilter=();

foreach $file (@files)
{
	print "Processing $file\n";

	#print "$line1\n$line2\n\n\n";

	$line1 = "cutadapt --cores 2 -q $quality -a $p7adapter -e $error --trimmed-only $file -o temp.fastq";
	system($line1);
	$line2 = "cutadapt --cores 2 -q $quality -g $p5adapter -e $error --trimmed-only temp.fastq -o $file.trimmed";
	system($line2);
	$numlines_prefilter = `wc -l $file`;
	@data = split(/\s+/,$numlines_prefilter);
	$prefilter{$file} = $data[1]/4;

	$numlines_postfilter = `wc -l $file.trimmed`;
	@data = split(/\s+/,$numlines_postfilter);
	$postfilter{$file} = $data[1]/4;

}

@filekeys = keys %prefilter;
foreach $file (@filekeys)
{
	print "$file\t$prefilter{$file}\t$postfilter{$file}\n";
}
