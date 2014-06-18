Fibonacci Modulus
=================

A quick perl script to find patterns in modulus maps over the Fibonacci sequence.

What it does
------------

* Calculate the Fibonacci sequence
* Map modulus functions over the sequence
* Identify repeated substrings
* Filter for adjacently repeating substrings
* Report on those substrings

What it looks like
------------------

		$ ./fibonacci_modulus.pl
		Calculating the Fibonacci sequence to 100
		Mapping modulus functions over the sequence from 2 to 32
		Identifying repating substrings in modulus: 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 
		Identifying adjacencies in substrings
		Saving modulus seauences to fibmod_sequences.csv
		Saving substring matches to fibmod_substrings.csv
		Saving results to fibmod_results.csv

		.---------------------------------------------------.
		| Longest substrings in Fibonacci Modulus Sequences |
		'---------------------------------------------------'

		 * In modulus sequence 2: 
		   * 1,1,0,1,1,0,1,1,0 repeats 11 times, covering 99% of the sequence.
		   * 0,1,1,0,1,1 repeats 16 times, covering 96% of the sequence.
		   * 0,1,1,0,1,1,0,1,1,0,1,1 repeats 8 times, covering 96% of the sequence.
		   * 1,0,1,1,0,1 repeats 16 times, covering 96% of the sequence.
		   * 1,0,1,1,0,1,1,0,1,1,0,1 repeats 8 times, covering 96% of the sequence.
		   * 1,1,0,1,1,0 repeats 16 times, covering 96% of the sequence.
		   * 1,1,0,1,1,0,1,1,0,1,1,0 repeats 8 times, covering 96% of the sequence.
		   * 0,1,1,0,1,1,0,1,1 repeats 10 times, covering 90% of the sequence.
		   * 0,1,1,0,1,1,0,1,1,0,1,1,0,1,1 repeats 6 times, covering 90% of the sequence.
		   * 0,1,1,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1 repeats 5 times, covering 90% of the sequence.
		   * 1,0,1,1,0,1,1,0,1 repeats 10 times, covering 90% of the sequence.
		   * 1,0,1,1,0,1,1,0,1,1,0,1,1,0,1 repeats 6 times, covering 90% of the sequence.
		   * 1,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1,0,1 repeats 5 times, covering 90% of the sequence.
		   * 1,1,0,1,1,0,1,1,0,1,1,0,1,1,0 repeats 6 times, covering 90% of the sequence.
		   * 1,1,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1,0 repeats 5 times, covering 90% of the sequence.

		 * In modulus sequence 3: 
		   * 0,2,2,1,0,1,1,2 repeats 12 times, covering 96% of the sequence.
		   * 0,2,2,1,0,1,1,2,0,2,2,1,0,1,1,2 repeats 6 times, covering 96% of the sequence.
		   * 1,1,2,0,2,2,1,0 repeats 12 times, covering 96% of the sequence.
		   * 1,1,2,0,2,2,1,0,1,1,2,0,2,2,1,0 repeats 6 times, covering 96% of the sequence.
		   * 1,2,0,2,2,1,0,1 repeats 12 times, covering 96% of the sequence.
		   * 1,2,0,2,2,1,0,1,1,2,0,2,2,1,0,1 repeats 6 times, covering 96% of the sequence.
		   * 2,0,2,2,1,0,1,1 repeats 12 times, covering 96% of the sequence.
		   * 2,0,2,2,1,0,1,1,2,0,2,2,1,0,1,1 repeats 6 times, covering 96% of the sequence.
		   * 0,1,1,2,0,2,2,1 repeats 11 times, covering 88% of the sequence.
		   * 1,0,1,1,2,0,2,2 repeats 11 times, covering 88% of the sequence.
		   * 2,1,0,1,1,2,0,2 repeats 11 times, covering 88% of the sequence.
		   * 2,2,1,0,1,1,2,0 repeats 11 times, covering 88% of the sequence.
		   * 0,1,1,2,0,2,2,1,0,1,1,2,0,2,2,1 repeats 5 times, covering 80% of the sequence.
		   * 1,0,1,1,2,0,2,2,1,0,1,1,2,0,2,2 repeats 5 times, covering 80% of the sequence.
		   * 2,1,0,1,1,2,0,2,2,1,0,1,1,2,0,2 repeats 5 times, covering 80% of the sequence.
		   * 2,2,1,0,1,1,2,0,2,2,1,0,1,1,2,0 repeats 5 times, covering 80% of the sequence.

		 * In modulus sequence 4: 
		   * 1,1,2,3,1,0 repeats 16 times, covering 96% of the sequence.
		   * 1,1,2,3,1,0,1,1,2,3,1,0 repeats 8 times, covering 96% of the sequence.
		   * 1,2,3,1,0,1 repeats 16 times, covering 96% of the sequence.
		   * 1,2,3,1,0,1,1,2,3,1,0,1 repeats 8 times, covering 96% of the sequence.
		   * 2,3,1,0,1,1 repeats 16 times, covering 96% of the sequence.
		   * 2,3,1,0,1,1,2,3,1,0,1,1 repeats 8 times, covering 96% of the sequence.
		   * 3,1,0,1,1,2 repeats 16 times, covering 96% of the sequence.
		   * 3,1,0,1,1,2,3,1,0,1,1,2 repeats 8 times, covering 96% of the sequence.
		   * 0,1,1,2,3,1 repeats 15 times, covering 90% of the sequence.
		   * 0,1,1,2,3,1,0,1,1,2,3,1,0,1,1,2,3,1 repeats 5 times, covering 90% of the sequence.
		   * 1,0,1,1,2,3 repeats 15 times, covering 90% of the sequence.
		   * 1,0,1,1,2,3,1,0,1,1,2,3,1,0,1,1,2,3 repeats 5 times, covering 90% of the sequence.
		   * 1,1,2,3,1,0,1,1,2,3,1,0,1,1,2,3,1,0 repeats 5 times, covering 90% of the sequence.
		   * 1,2,3,1,0,1,1,2,3,1,0,1,1,2,3,1,0,1 repeats 5 times, covering 90% of the sequence.
		   * 2,3,1,0,1,1,2,3,1,0,1,1,2,3,1,0,1,1 repeats 5 times, covering 90% of the sequence.
		   * 3,1,0,1,1,2,3,1,0,1,1,2,3,1,0,1,1,2 repeats 5 times, covering 90% of the sequence.
		   * 0,1,1,2,3,1,0,1,1,2,3,1 repeats 7 times, covering 84% of the sequence.
		   * 1,0,1,1,2,3,1,0,1,1,2,3 repeats 7 times, covering 84% of the sequence.

		 * In modulus sequence 5: 

		 * In modulus sequence 6: 

		 * In modulus sequence 7: 
		   * 1,1,2,3,5,1,6,0,6,6,5,4,2,6,1,0 repeats 6 times, covering 96% of the sequence.
		   * 1,2,3,5,1,6,0,6,6,5,4,2,6,1,0,1 repeats 6 times, covering 96% of the sequence.
		   * 2,3,5,1,6,0,6,6,5,4,2,6,1,0,1,1 repeats 6 times, covering 96% of the sequence.
		   * 3,5,1,6,0,6,6,5,4,2,6,1,0,1,1,2 repeats 6 times, covering 96% of the sequence.
		   * 0,1,1,2,3,5,1,6,0,6,6,5,4,2,6,1 repeats 5 times, covering 80% of the sequence.
		   * 0,6,6,5,4,2,6,1,0,1,1,2,3,5,1,6 repeats 5 times, covering 80% of the sequence.
		   * 1,0,1,1,2,3,5,1,6,0,6,6,5,4,2,6 repeats 5 times, covering 80% of the sequence.
		   * 1,6,0,6,6,5,4,2,6,1,0,1,1,2,3,5 repeats 5 times, covering 80% of the sequence.
		   * 2,6,1,0,1,1,2,3,5,1,6,0,6,6,5,4 repeats 5 times, covering 80% of the sequence.
		   * 4,2,6,1,0,1,1,2,3,5,1,6,0,6,6,5 repeats 5 times, covering 80% of the sequence.
		   * 5,1,6,0,6,6,5,4,2,6,1,0,1,1,2,3 repeats 5 times, covering 80% of the sequence.
		   * 5,4,2,6,1,0,1,1,2,3,5,1,6,0,6,6 repeats 5 times, covering 80% of the sequence.
		   * 6,0,6,6,5,4,2,6,1,0,1,1,2,3,5,1 repeats 5 times, covering 80% of the sequence.
		   * 6,1,0,1,1,2,3,5,1,6,0,6,6,5,4,2 repeats 5 times, covering 80% of the sequence.
		   * 6,5,4,2,6,1,0,1,1,2,3,5,1,6,0,6 repeats 5 times, covering 80% of the sequence.
		   * 6,6,5,4,2,6,1,0,1,1,2,3,5,1,6,0 repeats 5 times, covering 80% of the sequence.

		 * In modulus sequence 8: 
		   * 1,1,2,3,5,0,5,5,2,7,1,0 repeats 8 times, covering 96% of the sequence.
		   * 1,2,3,5,0,5,5,2,7,1,0,1 repeats 8 times, covering 96% of the sequence.
		   * 2,3,5,0,5,5,2,7,1,0,1,1 repeats 8 times, covering 96% of the sequence.
		   * 3,5,0,5,5,2,7,1,0,1,1,2 repeats 8 times, covering 96% of the sequence.
		   * 0,1,1,2,3,5,0,5,5,2,7,1 repeats 7 times, covering 84% of the sequence.
		   * 0,5,5,2,7,1,0,1,1,2,3,5 repeats 7 times, covering 84% of the sequence.
		   * 1,0,1,1,2,3,5,0,5,5,2,7 repeats 7 times, covering 84% of the sequence.
		   * 2,7,1,0,1,1,2,3,5,0,5,5 repeats 7 times, covering 84% of the sequence.
		   * 5,0,5,5,2,7,1,0,1,1,2,3 repeats 7 times, covering 84% of the sequence.
		   * 5,2,7,1,0,1,1,2,3,5,0,5 repeats 7 times, covering 84% of the sequence.
		   * 5,5,2,7,1,0,1,1,2,3,5,0 repeats 7 times, covering 84% of the sequence.
		   * 7,1,0,1,1,2,3,5,0,5,5,2 repeats 7 times, covering 84% of the sequence.

		 * In modulus sequence 9: 

		 * In modulus sequence 10: 

		 * In modulus sequence 11: 
		   * 0,1,1,2,3,5,8,2,10,1 repeats 9 times, covering 90% of the sequence.
		   * 1,0,1,1,2,3,5,8,2,10 repeats 9 times, covering 90% of the sequence.
		   * 1,1,2,3,5,8,2,10,1,0 repeats 9 times, covering 90% of the sequence.
		   * 1,2,3,5,8,2,10,1,0,1 repeats 9 times, covering 90% of the sequence.
		   * 10,1,0,1,1,2,3,5,8,2 repeats 9 times, covering 90% of the sequence.
		   * 2,10,1,0,1,1,2,3,5,8 repeats 9 times, covering 90% of the sequence.
		   * 2,3,5,8,2,10,1,0,1,1 repeats 9 times, covering 90% of the sequence.
		   * 3,5,8,2,10,1,0,1,1,2 repeats 9 times, covering 90% of the sequence.
		   * 5,8,2,10,1,0,1,1,2,3 repeats 9 times, covering 90% of the sequence.
		   * 8,2,10,1,0,1,1,2,3,5 repeats 9 times, covering 90% of the sequence.

		 * In modulus sequence 12: 

		 * In modulus sequence 13: 

		 * In modulus sequence 14: 

		 * In modulus sequence 15: 

		 * In modulus sequence 16: 

		 * In modulus sequence 17: 

		 * In modulus sequence 18: 

		 * In modulus sequence 19: 
		   * 1,1,2,3,5,8,13,2,15,17,13,11,5,16,2,18,1,0 repeats 5 times, covering 90% of the sequence.
		   * 1,2,3,5,8,13,2,15,17,13,11,5,16,2,18,1,0,1 repeats 5 times, covering 90% of the sequence.
		   * 13,2,15,17,13,11,5,16,2,18,1,0,1,1,2,3,5,8 repeats 5 times, covering 90% of the sequence.
		   * 15,17,13,11,5,16,2,18,1,0,1,1,2,3,5,8,13,2 repeats 5 times, covering 90% of the sequence.
		   * 17,13,11,5,16,2,18,1,0,1,1,2,3,5,8,13,2,15 repeats 5 times, covering 90% of the sequence.
		   * 2,15,17,13,11,5,16,2,18,1,0,1,1,2,3,5,8,13 repeats 5 times, covering 90% of the sequence.
		   * 2,3,5,8,13,2,15,17,13,11,5,16,2,18,1,0,1,1 repeats 5 times, covering 90% of the sequence.
		   * 3,5,8,13,2,15,17,13,11,5,16,2,18,1,0,1,1,2 repeats 5 times, covering 90% of the sequence.
		   * 5,8,13,2,15,17,13,11,5,16,2,18,1,0,1,1,2,3 repeats 5 times, covering 90% of the sequence.
		   * 8,13,2,15,17,13,11,5,16,2,18,1,0,1,1,2,3,5 repeats 5 times, covering 90% of the sequence.
		   * 0,1,1,2,3,5,8,13,2,15,17,13,11,5,16,2,18,1 repeats 4 times, covering 72% of the sequence.
		   * 1,0,1,1,2,3,5,8,13,2,15,17,13,11,5,16,2,18 repeats 4 times, covering 72% of the sequence.
		   * 11,5,16,2,18,1,0,1,1,2,3,5,8,13,2,15,17,13 repeats 4 times, covering 72% of the sequence.
		   * 13,11,5,16,2,18,1,0,1,1,2,3,5,8,13,2,15,17 repeats 4 times, covering 72% of the sequence.
		   * 16,2,18,1,0,1,1,2,3,5,8,13,2,15,17,13,11,5 repeats 4 times, covering 72% of the sequence.
		   * 18,1,0,1,1,2,3,5,8,13,2,15,17,13,11,5,16,2 repeats 4 times, covering 72% of the sequence.
		   * 2,18,1,0,1,1,2,3,5,8,13,2,15,17,13,11,5,16 repeats 4 times, covering 72% of the sequence.
		   * 5,16,2,18,1,0,1,1,2,3,5,8,13,2,15,17,13,11 repeats 4 times, covering 72% of the sequence.

		 * In modulus sequence 20: 

		 * In modulus sequence 21: 
		   * 1,1,2,3,5,8,13,0,13,13,5,18,2,20,1,0 repeats 6 times, covering 96% of the sequence.
		   * 1,2,3,5,8,13,0,13,13,5,18,2,20,1,0,1 repeats 6 times, covering 96% of the sequence.
		   * 2,3,5,8,13,0,13,13,5,18,2,20,1,0,1,1 repeats 6 times, covering 96% of the sequence.
		   * 3,5,8,13,0,13,13,5,18,2,20,1,0,1,1,2 repeats 6 times, covering 96% of the sequence.
		   * 0,1,1,2,3,5,8,13,0,13,13,5,18,2,20,1 repeats 5 times, covering 80% of the sequence.
		   * 0,13,13,5,18,2,20,1,0,1,1,2,3,5,8,13 repeats 5 times, covering 80% of the sequence.
		   * 1,0,1,1,2,3,5,8,13,0,13,13,5,18,2,20 repeats 5 times, covering 80% of the sequence.
		   * 13,0,13,13,5,18,2,20,1,0,1,1,2,3,5,8 repeats 5 times, covering 80% of the sequence.
		   * 13,13,5,18,2,20,1,0,1,1,2,3,5,8,13,0 repeats 5 times, covering 80% of the sequence.
		   * 13,5,18,2,20,1,0,1,1,2,3,5,8,13,0,13 repeats 5 times, covering 80% of the sequence.
		   * 18,2,20,1,0,1,1,2,3,5,8,13,0,13,13,5 repeats 5 times, covering 80% of the sequence.
		   * 2,20,1,0,1,1,2,3,5,8,13,0,13,13,5,18 repeats 5 times, covering 80% of the sequence.
		   * 20,1,0,1,1,2,3,5,8,13,0,13,13,5,18,2 repeats 5 times, covering 80% of the sequence.
		   * 5,18,2,20,1,0,1,1,2,3,5,8,13,0,13,13 repeats 5 times, covering 80% of the sequence.
		   * 5,8,13,0,13,13,5,18,2,20,1,0,1,1,2,3 repeats 5 times, covering 80% of the sequence.
		   * 8,13,0,13,13,5,18,2,20,1,0,1,1,2,3,5 repeats 5 times, covering 80% of the sequence.

		 * In modulus sequence 22: 

		 * In modulus sequence 23: 

		 * In modulus sequence 24: 

		 * In modulus sequence 25: 

		 * In modulus sequence 26: 

		 * In modulus sequence 27: 

		 * In modulus sequence 28: 

		 * In modulus sequence 29: 
		   * 1,1,2,3,5,8,13,21,5,26,2,28,1,0 repeats 7 times, covering 98% of the sequence.
		   * 1,2,3,5,8,13,21,5,26,2,28,1,0,1 repeats 7 times, covering 98% of the sequence.
		   * 0,1,1,2,3,5,8,13,21,5,26,2,28,1 repeats 6 times, covering 84% of the sequence.
		   * 1,0,1,1,2,3,5,8,13,21,5,26,2,28 repeats 6 times, covering 84% of the sequence.
		   * 13,21,5,26,2,28,1,0,1,1,2,3,5,8 repeats 6 times, covering 84% of the sequence.
		   * 2,28,1,0,1,1,2,3,5,8,13,21,5,26 repeats 6 times, covering 84% of the sequence.
		   * 2,3,5,8,13,21,5,26,2,28,1,0,1,1 repeats 6 times, covering 84% of the sequence.
		   * 21,5,26,2,28,1,0,1,1,2,3,5,8,13 repeats 6 times, covering 84% of the sequence.
		   * 26,2,28,1,0,1,1,2,3,5,8,13,21,5 repeats 6 times, covering 84% of the sequence.
		   * 28,1,0,1,1,2,3,5,8,13,21,5,26,2 repeats 6 times, covering 84% of the sequence.
		   * 3,5,8,13,21,5,26,2,28,1,0,1,1,2 repeats 6 times, covering 84% of the sequence.
		   * 5,26,2,28,1,0,1,1,2,3,5,8,13,21 repeats 6 times, covering 84% of the sequence.
		   * 5,8,13,21,5,26,2,28,1,0,1,1,2,3 repeats 6 times, covering 84% of the sequence.
		   * 8,13,21,5,26,2,28,1,0,1,1,2,3,5 repeats 6 times, covering 84% of the sequence.

		 * In modulus sequence 30: 

		 * In modulus sequence 31: 

		 * In modulus sequence 32: 

		Done.

