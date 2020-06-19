# co-presence_test
Test the statistical significance of the co-presence of two microorganisms in the same host

R script developed for statistically testing if the co-presence/absence of two microorganisms in the same host is random or due to biological reasons.
The test is done creating a null model (co-presence/absence values due to chance) permuting 9,999 times a presence/absence matrix of microorganisms.
Rows of the matrix are individuals tested for the presence of microorganisms, columns presence/absence of microorganisms. 

The co-presence of two microorganisms in the same host is considered due to chance when the observed co-presence value falls in the 95% of null distribution. On the contrary, if the observed value falls outside this range the co-presence/absence is considered significant.

The script was initially developed for testing the statistical significance of the co-presence/absences of microorganisms in ticks.
