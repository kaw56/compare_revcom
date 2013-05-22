#!usr/bin/perl
# comp_contigs.pl
use strict;
use warnings;

my $line = "CUST_34711_PI425544054 rc_contig00985";

my %hash = ();

$line =~ m/(CUST_\d+_\w+) (\w+)/;

$hash{$2} = $1;

print %hash, "\n";  