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

#### 2. Predicting ratings using the **Surprise** package
I use the surprise package to predict ratings for the movie lens database. I use the stochastic gradient descent approach provided
in the implementation, using 5 factors, and 10 epochs for estimating the gradient descent. 

#### 3. Estimating the ratings 
I use the item based factors developed by Surpise package along with movie genres classification to estimate ratings. I used 
a neighborhood based approach to calculate similarities and then estimate ratings. Missing ratings were assumed to be zero
and then weight based approach for ratings in the neighborhood were used to predict the ratings. 

#### 4. The Results
The item based collaborative approach used, was very slow (3 hours+ of processing time for 10m dataset). Presumably the code can be implemented in a much more efficient
way to improve processing times. As such, I decided to compare the results on a much smaller dataset of only **250** movies. The results were encouraging although further analysis
is needed to understand performance. The results show that on the training set the performance after including movie genres is slighly worse than than 
with SVD alone. One challenge has been the fact that the **Surprise** package uses a set of internal ids which makes a number of additional steps necessary.  

 

### References
1. F. Maxwell Harper and Joseph A. Konstan. 2015. The MovieLens Datasets: History and Context. ACM Transactions on Interactive Intelligent Systems (TiiS) 5, 4: 19:1–19:19. 
https://doi.org/10.1145/2827872
2. J. Leskovec, A. Rajaraman, J. Ullman: Mining of Massive Datasets, http://www.mmds.org
3. The Surprise Package - https://surprise.readthedocs.io/en/stable/getting_started.html


