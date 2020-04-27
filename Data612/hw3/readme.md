## Developing Collaborative Filtering Using Singular Value Decomposition and Alternating Least Squares


## Project 3
> In this assignment, we are asked to implement or use Singular value decomposition or alternating least squares:

#### 1. Alternating Least Squares 

Alternating least squares can be used to estimate the solution to the optimization problem where the missing ratings are 
estimated using an approach where, factors related to users are fixed while a least squares solution is estimated for the movies/items. 
On the other hand, the items are fixed, while a least squares solution is estimated for the factors related to users. For the implementation
of the ALS solution I used an implementation developed and referenced below.  

The results shown below and discussed below are using the movie lens dataset. For the analysis I split the dataset 70% into
training and the remaining 30% into the test set. 

I tested different numbers of factors to implement the analysis. The results, in terms of errors on the training data,
are shown for 3 factors and 15 factors. 

![](images/ALS_3factors.png)

![](images/ALS_15factors.png)

As can be seen the error on the training set is much lower on the training set with 15 factors than compared to 3 factors. 
The figure below shows the different solutions that were run. These include 3 factors, and lambda (the regularization parameter)
at 0.1, followed by 5 factors with lambda at 0.1, and 5 factors with lambda at 0.3, 10 factors 

![](images/train_rmse.png)


### References
1. F. Maxwell Harper and Joseph A. Konstan. 2015. The MovieLens Datasets: History and Context. ACM Transactions on Interactive Intelligent Systems (TiiS) 5, 4: 19:1–19:19. 
https://doi.org/10.1145/2827872
2. J. Leskovec, A. Rajaraman, J. Ullman: Mining of Massive Datasets, http://www.mmds.org
3. Implementation of ALS Factorization - https://github.com/mickeykedia/Matrix-Factorization-ALS/blob/master/ALS%20Python%20Implementation.py)


