## Evaluating the Accuracy of Recommender Systems


## Project 4
> In this assignment I use the **Surprise** package to developing / implmenting SVD decomposition. Additionally, working with 
Movielens dataset I incorporate the movie genres into the similarity calculation. The **Surprise** package only uses ratings 
to estimate SVD and rankings. As such, I write a number of functions to calculate / predict ratings. Key aspects of the approach is:
- Use the movie genres classification through one-Hot encoding
- Then use SVD factors together with movie genres classification to estimate the similarities across items
- Use a neighborhood based approach to estimate ratings
- Compare rating results with including the movie genres and without including the results

#### 1. Extracting the Movie Genres
I continue to use the movielens 10m dataset for this analysis. Movie genres classifications are provided along with the movie
names associated with the dataset. I use one-hot encoding to create numerical values for each of the associated genres. 

 

### References
1. F. Maxwell Harper and Joseph A. Konstan. 2015. The MovieLens Datasets: History and Context. ACM Transactions on Interactive Intelligent Systems (TiiS) 5, 4: 19:1–19:19. 
https://doi.org/10.1145/2827872
2. J. Leskovec, A. Rajaraman, J. Ullman: Mining of Massive Datasets, http://www.mmds.org
3. Implementation of ALS Factorization - https://github.com/mickeykedia/Matrix-Factorization-ALS/blob/master/ALS%20Python%20Implementation.py)


