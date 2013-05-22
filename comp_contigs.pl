#!usr/bin/perl
# comp_contigs.pl
use strict;
use warnings;

die "usage: comp_contigs <file with probe list>" unless (@ARGV == 1);

my $filename = shift @ARGV;
open($probe_list, '<', $filename);

# put each probe into a particular hash (reverse, forward, genes)
my %reverse_probes_for  = ();
my %forward_probes_for  = ();
my %genes_probes_for 	= ();

while (my $line = <$probe_list>) {
	if ($line =~ m/(CUST_\d+_\w+) (rc_contig\d{5})/) {
		
	}

	elsif # line contains pattern contig\d{5} put in contig hash 

	else # put in gene hash

}

# loop through the contigs, find the ones that have the same id and see if
# they are the same

# if they are the same add to an array

# if not add to a different array
