#!usr/bin/perl
# comp_contigs.pl
use strict;
use warnings;

my $line = "CUST_34711_PI425544054 rc_contig00985";


if ($line =~ m/(CUST_\d+_\w+) (rc_contig\d{5})/) { 
	print "probe: $1, contig: $2\n";
} else {
	print "Boo\n"
}