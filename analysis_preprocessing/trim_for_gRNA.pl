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
