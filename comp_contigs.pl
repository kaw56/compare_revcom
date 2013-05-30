#!usr/bin/perl
# comp_contigs.pl
use strict;
use warnings;
use Array::Utils qw(:all);


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
		# add entry to array in reverse hash
		push(@{$reverse_probe_for{$2}}, $1);

	} elsif ($line =~ m/(CUST_\d+_\w+)\s(contig\d{5})/) {
		# add entry to array in forward hash
		push(@{$forward_probe_for{$2}}, $1);

	} else {
		# add entry to gene hash
		$line =~ m/(CUST_\d+_\w+)\s(\w+)/;
		push(@{$gene_probe_for{$2}}, $1);
	}
}


# comparing the contigs
my @same_probes;
my @different_probes;

foreach my $contig (keys %reverse_probe_for) {
	# get the arrays of forward and back
	my @forward = @{$forward_probe_for{$contig}};
	my @reverse = @{$reverse_probe_for{$contig}};

	# sort each of them
	@forward = sort @forward;
	@reverse = sort @reverse;

	# smart match test
	if (!array_diff(@forward, @reverse) ) {
		push(@same_probes, $contig);
 	} else {
 		push(@different_probes, $contig);
	}
}



print scalar(keys %forward_probe_for), " reverse contigs\n";
print scalar(keys %forward_probe_for), " forward contigs\n";
print scalar(keys %gene_probe_for), " gene contigs\n";
print scalar(@same_probes), " are the same\n";
print scalar(@different_probes), " are different\n";
