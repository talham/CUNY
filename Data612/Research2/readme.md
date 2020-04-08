# Research Assignment 2


>*For this discussion item, please watch the following talk (http://www.youtube.com/watch?v=3LBgiFch4_g) and summarize what you found to be the most important or interesting points.* 
>*The first half will cover some of the mathematical techniques covered in this unit's reading and the second half some of the data management challenges in an industrial-scale recommendation system.*

I found this talk very fascinating and found some of following points very interesting: 

1) *The use of matrix factorization techniques:* The use of matrix factorization techniques to reduce dimensionality for developing a recommendation engine
is very interesting. In particular, the use matrix factorization to make the problem more tractable together with the use of regularization approaches such as 
ridge regression or lasso is quite interesting. While the techniques are not new - the specific application to the problem is quite interesting

2) *The use of Alternating Least Squares:* I found the use of ALS techniques to solve the problem also quite interesting. It was not clear from the talk why the use of ALS
was required, or the other approaches available to solve the problem (this weeks readings including this data science post should add additional information https://towardsdatascience.com/prototyping-a-recommender-system-step-by-step-part-2-alternating-least-square-als-matrix-4a76c58714a1).

3) *Use of Spark versus Hadoop:* The use of Spark is significantly faster than Hadoop particularly in this case since the algorithm that is being used iterative
Thus, for each iteration there is map phase and reduce phase, along with output to disk, which also has then redundancy built in. 

4) *Use of Half-Gridify and Full Gridify methods*: Beyond the specific implementations of the methods themselves, I find it interesting in how thinking about improving efficiency
and working on solutions to make the calculations more efficient helps!    