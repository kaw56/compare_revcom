#!usr/bin/perl
# comp_contigs.pl
use strict;
use warnings;

die "usage: comp_contigs <file with probe list>" unless (@ARGV == 1);

my $filename = shift @ARGV;
open(my $probe_list, '<', $filename) or die "can't open $filename, $!";

# put each probe into a particular hash (reverse, forward, genes)
my %reverse_probe_for  = ();
my %forward_probe_for  = ();
my %gene_probe_for 	= ();

while (my $line = <$probe_list>) {
	if ($line !~ m/CUST_\d+_\w+/) {
		next;
	}
	if ($line =~ m/(CUST_\d+_\w+)\src_(contig\d{5})/) {
		
		# add an entry to reverse hash
		$reverse_probe_for{$2} = $1;

	} elsif ($line =~ m/(CUST_\d+_\w+)\s(contig\d{5})/) { 
		
		# add entry to forward hash
		$forward_probe_for{$2} = $1;

	} else { 
		# add entry to gene hash
		$line =~ m/(CUST_\d+_\w+)\s(\w+)/;
		$gene_probe_for{$2} = $1;
	} 

}

# loop through the contigs, find the ones that have the same id and see if
# they are the same

# if they are the same add to an array

# if not add to a different array
