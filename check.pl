#!/usr/bin/perl -w

if (!-l $ARGV[0] && -f $ARGV[0]) {

	open $file1, $ARGV[0];
	$fname = <$file1>;
	chomp($fname);

	open ($file2, $fname) or die("$!");
	open $file3, '>>', "/tmp/testlog";
	$line = <$file2>;

	chomp ($line);
	print $file3 $line, "\n";
	
	close $file2;cat 
	close $file3;
	close $file1;
	unlink($ARGV[0]);

	sleep(1);
	open $file1, '>', "/tmp/testlog";
	close $file1;

}
else {
	exit(0);
}
