Data Dictionary
================
1. ActivityName - activity name.   
Possible values are LAYING,SITTING,STANDING,WALKING, WALKING\_DOWNSTAIRS and WALKING\_UPSTAIRS
2. SubjectId - integer subject identifier that indentifies one of the 30 subjects.  
Possible values are integers from 1 to 30.

The remaining 66 variables (number 3 through 68 below) are the average/mean of 
the corresponding source dataset variable over a particular ActivityName and 
FeatureName combination. They are all numeric and in the range [-1,1].

The source dataset variables are explained in features_info.txt. The units of the
averages i.e. variables in this dataset are the same as in the source dataset. In
other words, the time domain acceleration variables whose names start with t are in
in standard gravity units 'g'. There are frequency domain variables for each of 
these which are obtained via FFT of the time domain variables and they are hence
in the inverse units.
Since all source features are normalized and bounded within [-1,1], the variables
in this dataset, which are their averages, are also in the same range.

The naming convention for the below variables is illustrated with an example.  
_For the source variable fBodyAccMag-mean(), the output average variable is
fBodyAccMag.mean.avg and it contains the mean of fBodyAccMag-mean() values for
each SubjectId and ActivityName combination_.  
Similar naming logic applies to all the other variables below. The _(_ and _) _
characters are stripped from the source variable name and _-_ is replaced by _._
Finally _.avg_ is suffixed to generate the final average variable name. 
The character replacements are intended to allow easy reading by _read.table_ which 
does not allow the _(_, _)_ and _-_ characters in variable names.

Conceptually related variables are grouped together in the listing below.

3. tBodyAcc.mean.X.avg
4. tBodyAcc.mean.Y.avg 
5. tBodyAcc.mean.Z.avg 
6. tBodyAcc.std.X.avg
7. tBodyAcc.std.Y.avg 
8. tBodyAcc.std.Z.avg 
  
9. tGravityAcc.mean.X.avg
10. tGravityAcc.mean.Y.avg
11. tGravityAcc.mean.Z.avg 
12. tGravityAcc.std.X.avg
13. tGravityAcc.std.Y.avg 
14. tGravityAcc.std.Z.avg
  
15. tBodyAccJerk.mean.X.avg
16. tBodyAccJerk.mean.Y.avg 
17. tBodyAccJerk.mean.Z.avg 
18. tBodyAccJerk.std.X.avg
19. tBodyAccJerk.std.Y.avg 
20. tBodyAccJerk.std.Z.avg 
  
21. tBodyGyro.mean.X.avg
22. tBodyGyro.mean.Y.avg 
23. tBodyGyro.mean.Z.avg 
24. tBodyGyro.std.X.avg
25. tBodyGyro.std.Y.avg 
26. tBodyGyro.std.Z.avg
  
27. tBodyGyroJerk.mean.X.avg
28. tBodyGyroJerk.mean.Y.avg 
29. tBodyGyroJerk.mean.Z.avg 
30. tBodyGyroJerk.std.X.avg
31. tBodyGyroJerk.std.Y.avg 
32. tBodyGyroJerk.std.Z.avg 
  
33. tBodyAccMag.mean.avg
34. tBodyAccMag.std.avg
35. tGravityAccMag.mean.avg
36. tGravityAccMag.std.avg
  
37. tBodyAccJerkMag.mean.avg
38. tBodyAccJerkMag.std.avg
  
39. tBodyGyroMag.mean.avg
40. tBodyGyroMag.std.avg
  
41. tBodyGyroJerkMag.mean.avg
42. tBodyGyroJerkMag.std.avg
  
43. fBodyAcc.mean.X.avg
44. fBodyAcc.mean.Y.avg 
45. fBodyAcc.mean.Z.avg 
46. fBodyAcc.std.X.avg
47. fBodyAcc.std.Y.avg 
48. fBodyAcc.std.Z.avg 
  
49. fBodyAccJerk.mean.X.avg
50. fBodyAccJerk.mean.Y.avg 
51. fBodyAccJerk.mean.Z.avg 
52. fBodyAccJerk.std.X.avg
53. fBodyAccJerk.std.Y.avg 
54. fBodyAccJerk.std.Z.avg 
  
55. fBodyGyro.mean.X.avg
56. fBodyGyro.mean.Y.avg 
57. fBodyGyro.mean.Z.avg 
58. fBodyGyro.std.X.avg
59. fBodyGyro.std.Y.avg 
60. fBodyGyro.std.Z.avg 
  
61. fBodyAccMag.mean.avg
62. fBodyAccMag.std.avg
  
63. fBodyBodyAccJerkMag.mean.avg
64. fBodyBodyAccJerkMag.std.avg
  
65. fBodyBodyGyroMag.mean.avg
66. fBodyBodyGyroMag.std.avg
  
67. fBodyBodyGyroJerkMag.mean.avg
68. fBodyBodyGyroJerkMag.std.avg