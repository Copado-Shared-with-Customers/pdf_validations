*** Settings *** 
Library   DocTest.VisualTest

*** Test Cases *** 
Compare two Images and highlight differences
  Compare Images   Reference.jpg   Candidate.jpg