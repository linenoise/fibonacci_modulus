#!/usr/bin/perl -w
use strict;
use bigint;
use Data::Dumper;

###
# fibonacci_modulus.pl
#
# Extracts patterns from modulus maps over the Fibonacci sequence
#
# By Dann Stayskal: <dann@stayskal.com> and <http://dann.stayskal.com/>
# Released under MIT license.
#
# Structure:
#   * Calculate the Fibonacci sequence
#   * Map modulus functions over the sequence
#   * Identify repeated substrings
#   * Identify adjacently repeating substrings
#   * Report on those subtrings
#
# References:
#   * https://en.wikipedia.org/wiki/Fibonacci_number
###

my $sequence_length = 100;
my $min_substring_length = 3;
my $max_substring_length = 18;
my $mod_start = 2;
my $mod_end = 32;

print "Calculating the Fibonacci sequence to $sequence_length\n";
my $base_sequence = fibonacci($sequence_length);

print "Mapping modulus functions over the sequence from $mod_start to $mod_end\n";
my $modulus_cache = [];
foreach my $modulus ($mod_start..$mod_end) {
	my @mapped_sequence = map({$_ % $modulus} @$base_sequence);
	push @$modulus_cache, \@mapped_sequence;
}

print "Identifying repating substrings in modulus: ";
my $substring_cache = {};
foreach my $s (0..scalar(@$modulus_cache)-1) {
	my $substrings = {};
	my $modulus = $s + $mod_start;
	print "$modulus ";
	foreach my $i (0..$sequence_length-1) {
		my @sub_sequence = ();
		foreach my $j (0..$max_substring_length-1){
			next if $i + $j >= $sequence_length;
			
			push @sub_sequence, $modulus_cache->[$s]->[$i+$j];
			my $signature = join(',',@sub_sequence);
			
			$substring_cache->{$modulus}->{$signature} ||= {};
			$substring_cache->{$modulus}->{$signature}->{length} = $j+1;
			$substring_cache->{$modulus}->{$signature}->{occurrences}++;
		}
	}	
}
print "\n";

print "Identifying adjacencies in substrings\n";
foreach my $sequence (sort(keys(%$substring_cache))) {
	my $sequence_string = join(',', @{$modulus_cache->[$sequence-$mod_start]});

	foreach my $substring (sort(keys %{$substring_cache->{$sequence}})){
		my $match_substring = "$substring,";

		if ($substring_cache->{$sequence}->{$substring}->{occurrences} > 1){
			
			# Concatenate the substring to itself and match repeatedly 
			# until the longest match is found
			my $adj_repetitions = 2;
			while ($adj_repetitions * length($substring) < length($sequence_string)) {
				my $match_substring = $match_substring x $adj_repetitions;
				if ($sequence_string =~ m/$match_substring/){
					$substring_cache->{$sequence}->{$substring}->{adjacencies} = $adj_repetitions;
					$substring_cache->{$sequence}->{$substring}->{adjacent_match_length} = length($match_substring);
				} else { last; }
				$adj_repetitions++;
			}	
		}		
	}
}


# Save the modulus sequences
print "Saving modulus seauences to fibmod_sequences.csv\n";
open(SEQ, '>', 'fibmod_sequences.csv') || die "Can't open fibmod_sequences.csv for writing.";
foreach my $s (0..scalar(@$modulus_cache-1)) {
	my $modulus = $s + $mod_start;
	print SEQ "\"Fibonacci modulus $modulus\", ".join(', ', @{$modulus_cache->[$s]})."\n";
}
close(SEQ);

# Save the substring matches
print "Saving substring matches to fibmod_substrings.csv\n";
open(SUBSTRINGS, '>', 'fibmod_substrings.csv') || die "Can't open fibmod_substrings.csv for writing.";
print SUBSTRINGS '"Fibonacci modulus", "Substring", "Length", "Occurrences", "Adjacencies", "Adjacent Match Length"'."\n";
foreach my $sequence (sort(keys(%$substring_cache))) {
	foreach my $substring (sort(keys %{$substring_cache->{$sequence}})){
		foreach my $key (qw/length occurrences adjacencies adjacent_match_length/){
			$substring_cache->{$sequence}->{$substring}->{$key} ||= 0;
		}
		if ($substring_cache->{$sequence}->{$substring}->{occurrences} > 1) {
			if ($substring_cache->{$sequence}->{$substring}->{length} > $min_substring_length) {
				print SUBSTRINGS "\"$sequence\", \"$substring\", " .
					'"' . $substring_cache->{$sequence}->{$substring}->{length} . '", ' .
					'"' . $substring_cache->{$sequence}->{$substring}->{occurrences} . 
					'"' . $substring_cache->{$sequence}->{$substring}->{adjacencies} . '", ' .
					'"' . $substring_cache->{$sequence}->{$substring}->{adjacent_match_length} . 
					"\"\n";				
			}
		}
	}
}
close(SUBSTRINGS); 


# Print the results
print "Saving results to fibmod_results.csv\n";
print "\n";
print ".---------------------------------------------------.\n";
print "| Longest substrings in Fibonacci Modulus Sequences |\n";
print "'---------------------------------------------------'\n\n";
open(RESULTS, '>', 'fibmod_results.csv') || die "Can't open fibmod_results.csv for writing.";
print RESULTS '"Fibonacci modulus", "Substring", "Repetitions", "Length", "Coverage"'."\n";
foreach my $sequence ($mod_start..$mod_end) {
	print " * In modulus sequence $sequence: \n";
	
	# Flatten our substring cache hash to an array
	my @flattened_sequences = ();
	foreach my $substring (sort(keys %{$substring_cache->{$sequence}})){
		$substring_cache->{$sequence}->{$substring}->{substring} = $substring;
		push @flattened_sequences, $substring_cache->{$sequence}->{$substring};
	}
	
	# Schwarzian transform the flattened array to sort
	my @sorted_by_adjacent_match_length = map  { $_->[0] }
		sort { $b->[1] <=> $a->[1] }
			map  { [$_, $_->{adjacent_match_length}] }
				@flattened_sequences;

	foreach my $sequence (@sorted_by_adjacent_match_length){
		last if $sequence->{adjacent_match_length} == 0;
		next if $sequence->{length} < 4;

		my $pattern_length = scalar(split(',',$sequence->{'substring'})) * $sequence->{'adjacencies'};
		my $pattern_coverage = (100.0 * $pattern_length / $sequence_length);
		print RESULTS "\"$sequence\", \"".$sequence->{substring}."\", \"".$sequence->{'adjacencies'}."\", \"".$pattern_length."\", \"$pattern_coverage%\"\n";
		print "   * " . $sequence->{substring} . " repeats ".$sequence->{'adjacencies'}. " times, covering $pattern_coverage% of the sequence.\n";
	}
	
	print "\n";
}
close(RESULTS);

print "Done.\n\n";
exit 0;


###
# &fibonacci
#
# Calculates a Fibonacci sequence.
# Takes: $length, an integer representing the desired length of the sequence
# Returns: \@sequence, an array reference containing the desired sequence.
###
sub fibonacci {
	my ($length) = @_;
	my ($a, $b) = (0, 1);
	my @sequence = ();
	for (my $i=0;$i<$length;$i++){
		push(@sequence, $b);
		my $sum = $a + $b;
		$a = $b;
		$b = $sum;
	}
	return \@sequence;
}